import 'package:flutter/material.dart';
import 'package:intelligentsia_forms/standard_field_style.dart';
import 'package:intelligentsia_forms/theme_colors.dart';

class GenderSelector extends StatefulWidget {
  // Controller
  final void Function(String gender) onGenderSelected;

  /// The label displayed above the field.
  final String fieldName;
  final Color? fieldNameColor;
  final double fieldFontSize;
  final FontWeight fieldFontWeight;

  // Gender Values
  final List<String> genders;
  final double fontSize;

  // Theme Colors
  final Color primaryColor;
  final Color fontColor;
  final Color fillBackgroundColor;

  // Borders
  final BorderRadius borderRadius;
  final BoxBorder? borderStyle;

  // Padding
  final EdgeInsets insidePadding;
  final EdgeInsets outsidePadding;

  const GenderSelector({
    super.key,
    required this.onGenderSelected,

    // Field Name
    this.fieldName = "Gender",
    this.fieldNameColor,
    this.fieldFontSize = StandardFieldStyle.fieldFontSize,
    this.fieldFontWeight = StandardFieldStyle.fieldFontWeight,

    // Gender Values
    this.genders = const ['Male', 'Female'],
    this.fontSize = 15,

    // Theme Colors
    this.primaryColor = ThemeColors.primary,
    this.fontColor = ThemeColors.backgroundColor,
    this.fillBackgroundColor = ThemeColors.backgroundColor,

    // Borders
    this.borderRadius = StandardFieldStyle.borderRadius,
    this.borderStyle,

    // Padding
    this.insidePadding = StandardFieldStyle.insidePadding,
    this.outsidePadding = StandardFieldStyle.outsidePadding,
  });

  @override
  GenderSelectorState createState() => GenderSelectorState();
}

class GenderSelectorState extends State<GenderSelector> {
  late String selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = widget.genders.first;
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
            widget.fieldName,
            style: TextStyle(
              fontSize: widget.fieldFontSize,
              color: widget.fieldNameColor ?? widget.primaryColor,
              fontWeight: widget.fieldFontWeight,
            ),
          ),
          const SizedBox(height: 8),

          // ---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---#---
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.genders
                .map((String gender) => _customGenderOption(gender))
                .toList(),
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }

  TextStyle _genderTextStyle(bool isSelected) {
    return TextStyle(
      color: isSelected ? widget.fontColor : widget.primaryColor,
      fontSize: widget.fontSize,
      letterSpacing: 1.09,
    );
  }

  BoxDecoration _genderBoxDecoration(bool isSelected) {
    return BoxDecoration(
        color: isSelected ? widget.primaryColor : widget.fillBackgroundColor,
        borderRadius: widget.borderRadius,
        border: widget.borderStyle ?? StandardFieldStyle.borderStyle);
  }

  void handleGenderSelection(String gender) {
    setState(() {
      selectedGender = gender;
    });
    widget.onGenderSelected(gender);
  }

  Widget displayGenderOption(String gender, bool isSelected) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          gender,
          style: _genderTextStyle(isSelected),
        ),
      ],
    );
  }

  Widget _customGenderOption(String gender) {
    bool isSelected = selectedGender == gender;
    return Expanded(
      child: InkWell(
        onTap: () => handleGenderSelection(gender),
        child: Container(
          padding: widget.insidePadding,
          margin: gender == widget.genders.first
              ? const EdgeInsets.only(right: 5)
              : const EdgeInsets.only(left: 5),
          decoration: _genderBoxDecoration(isSelected),
          child: displayGenderOption(gender, isSelected),
        ),
      ),
    );
  }
}
