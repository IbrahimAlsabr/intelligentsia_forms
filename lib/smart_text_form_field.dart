import 'package:flutter/material.dart';
import 'package:intelligentsia_forms/standard_field_style.dart';

enum FormType { email, password, aboutMe, userName }

class SmartTextFormField extends StatefulWidget {
  final FormType formType;

  /// The label displayed above the field.
  final Color? fieldNameColor;
  final double fieldFontSize;
  final FontWeight fieldFontWeight;

  /// Hint text displayed inside the field.
  final Color hintTextColor;
  final double hintTextFontSize;
  final FontWeight hintTextFontWeight;

  /// Icon shown as a prefix and suffix inside the field.
  final Color? iconColor;
  final double iconSize;
  final IconData? suffixIconData;
  final bool outlinedIcon;

  /// Border styling.
  final BoxBorder? borderStyle;
  final BorderRadius borderRadius;
  final BorderSide enabledBorderSide;
  final BorderSide focusedBorderSide;
  final BorderSide errorBorderSide;
  final BorderSide focusedErrorBorderSide;

  /// Error messages and styling.
  final TextStyle? errorMessageStyle;

  /// Padding around the field.
  final EdgeInsets insidePadding;
  final EdgeInsets outsidePadding;

  /// Controllers for text input.
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  /// Global field settings.
  final Color fillColor;
  final Color primaryColor;

  const SmartTextFormField({
    super.key,
    required this.formType,

    // Controllers
    this.controller,
    this.onChanged,

    // Field Name
    this.fieldNameColor,
    this.fieldFontSize = StandardFieldStyle.fieldFontSize,
    this.fieldFontWeight = StandardFieldStyle.fieldFontWeight,

    // Hint Text
    this.hintTextColor = StandardFieldStyle.hintTextColor,
    this.hintTextFontSize = StandardFieldStyle.hintTextFontSize,
    this.hintTextFontWeight = StandardFieldStyle.hintTextFontWeight,

    // Prefix Icon
    this.iconColor,
    this.iconSize = StandardFieldStyle.iconSize,
    this.suffixIconData,
    this.outlinedIcon = StandardFieldStyle.outlinedIcon,

    // Borders
    this.borderRadius = StandardFieldStyle.borderRadius,
    this.enabledBorderSide = StandardFieldStyle.enabledBorderSide,
    this.focusedBorderSide = StandardFieldStyle.focusedBorderSide,
    this.errorBorderSide = StandardFieldStyle.errorBorderSide,
    this.focusedErrorBorderSide = StandardFieldStyle.focusedErrorBorderSide,
    this.borderStyle,

    // Error Message
    this.errorMessageStyle = StandardFieldStyle.errorMessageStyle,

    // Padding
    this.insidePadding = StandardFieldStyle.insidePadding,
    this.outsidePadding = StandardFieldStyle.outsidePadding,

    // Global
    this.fillColor = StandardFieldStyle.fillColor,
    this.primaryColor = StandardFieldStyle.primaryColor,
  });

  @override
  SmartTextFormFieldState createState() => SmartTextFormFieldState();
}

class SmartTextFormFieldState extends State<SmartTextFormField> {
  /// The label displayed above the field.
  late String fieldName;

  /// Hint text displayed inside the field.
  late String hintText;

  /// Icon shown as a prefix and suffix inside the field.
  late IconData iconData;

  /// Error messages and styling.
  late String emptyFieldErrorMessage;
  late String invalidFormErrorMessage;

  /// Global field settings.
  late bool enableSuggestions;
  late int maxLines;
  late int minLines;
  late TextInputAction textInputAction;
  late TextInputType inputType;

  /// Tracks the visibility of the password
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    initializeProperties();
  }

  /// Initializes properties based on the form type
  void initializeProperties() {
    switch (widget.formType) {
      case FormType.email:
        fieldName = 'Email';
        hintText = 'Enter your email';
        iconData = widget.outlinedIcon ? Icons.email_outlined : Icons.email;
        invalidFormErrorMessage = "Please enter a valid email";
        emptyFieldErrorMessage = "Please enter your email";
        inputType = TextInputType.emailAddress;
        enableSuggestions = true;
        maxLines = 1;
        minLines = 1;
        textInputAction = TextInputAction.done;
        break;

      case FormType.aboutMe:
        fieldName = 'About Me';
        hintText = 'Tell us about yourself';
        iconData =
            widget.outlinedIcon ? Icons.person_pin_outlined : Icons.person_pin;
        invalidFormErrorMessage = "Invalid input";
        emptyFieldErrorMessage = "Please enter some information about yourself";
        inputType = TextInputType.multiline;
        enableSuggestions = true;
        maxLines = 3;
        minLines = 1;
        textInputAction = TextInputAction.newline;
        break;

      case FormType.password:
        fieldName = 'Password';
        hintText = 'Enter your password';
        iconData = widget.outlinedIcon ? Icons.lock_outlined : Icons.lock;
        invalidFormErrorMessage = "Password must be at least 6 characters";
        emptyFieldErrorMessage = "Please enter your password";
        inputType = TextInputType.visiblePassword;
        enableSuggestions = false;
        maxLines = 1;
        minLines = 1;
        textInputAction = TextInputAction.done;
        break;

      case FormType.userName:
        fieldName = 'Username';
        hintText = 'Enter your username';
        iconData = widget.outlinedIcon ? Icons.person_outline : Icons.person;
        invalidFormErrorMessage = "Invalid username";
        emptyFieldErrorMessage = "Please enter your username";
        inputType = TextInputType.text;
        enableSuggestions = true;
        maxLines = 1;
        minLines = 1;
        textInputAction = TextInputAction.done;
        break;
    }
  }

  /// Toggles the visibility of the password
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.outsidePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---
          Text(
            fieldName,
            style: TextStyle(
              fontSize: widget.fieldFontSize,
              color: widget.fieldNameColor ?? widget.primaryColor,
              fontWeight: widget.fieldFontWeight,
            ),
          ),
          const SizedBox(height: 8),

          // ---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---
          TextFormField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            keyboardType: inputType,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enableSuggestions: enableSuggestions,
            maxLines: maxLines,
            minLines: minLines,
            textInputAction: textInputAction,
            obscureText:
                widget.formType == FormType.password && !_isPasswordVisible,
            validator: (value) => inputValidator(value),

            // ---*---*---*---*---*---*---*---*---*---*---*---*---*
            decoration: InputDecoration(
              prefixIcon: Icon(iconData,
                  size: widget.iconSize,
                  color: widget.iconColor ?? widget.primaryColor),
              suffixIcon: passwordSuffixIcon(),
              contentPadding: const EdgeInsets.all(12),
              filled: true,
              fillColor: widget.fillColor,

              // ---*---*---*---*---*---*---*---*---*---*---*---*---*
              hintText: hintText,
              hintStyle: TextStyle(
                color: widget.hintTextColor,
                fontWeight: widget.hintTextFontWeight,
                fontSize: widget.hintTextFontSize,
              ),

              // ---*---*---*---*---*---*---*---*---*---*---*---*---*
              enabledBorder: OutlineInputBorder(
                borderRadius: widget.borderRadius,
                borderSide: widget.enabledBorderSide,
              ),

              // ---*---*---*---*---*---*---*---*---*---*---*---*---*
              focusedBorder: OutlineInputBorder(
                borderRadius: widget.borderRadius,
                borderSide: widget.focusedBorderSide,
              ),

              // ---*---*---*---*---*---*---*---*---*---*---*---*---*
              errorBorder: OutlineInputBorder(
                borderRadius: widget.borderRadius,
                borderSide: widget.errorBorderSide,
              ),

              // ---*---*---*---*---*---*---*---*---*---*---*---*---*
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: widget.borderRadius,
                borderSide: widget.focusedErrorBorderSide,
              ),

              // ---*---*---*---*---*---*---*---*---*---*---*---*---*
              errorStyle: widget.errorMessageStyle,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  String? inputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return emptyFieldErrorMessage;
    } else if (widget.formType == FormType.email &&
        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return invalidFormErrorMessage;
    } else if (widget.formType == FormType.password && value.length < 6) {
      return invalidFormErrorMessage;
    }
    return null;
  }

  IconButton? passwordSuffixIcon() {
    return widget.formType == FormType.password
        ? IconButton(
            icon: Icon(
              _isPasswordVisible
                  ? (widget.outlinedIcon
                      ? Icons.visibility_outlined
                      : Icons.visibility)
                  : (widget.outlinedIcon
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_off),
              color: widget.iconColor ?? widget.primaryColor,
            ),
            onPressed: _togglePasswordVisibility, // Toggle visibility
          )
        : null;
  }
}
