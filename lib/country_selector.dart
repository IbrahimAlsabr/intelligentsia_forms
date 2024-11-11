import 'package:another_flushbar/flushbar.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:intelligentsia_forms/standard_field_style.dart';
import 'package:intelligentsia_forms/theme_colors.dart';

class CountrySelector extends StatefulWidget {
  final Function(String countryName, String countryCode, String countryFlag) onCountrySelected;

  /// The label displayed above the field.
  final String fieldName;
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
  final bool showInfoSuffixIcon;
  final bool outlinedIcon;

  // Flush Bar
  final bool showFlushBar;
  final String flushBarMessage;
  final int flushBarDurationMessageInSec;
  final FlushbarPosition flushBarPosition;

  // Global
  final Color primaryColor;
  final Color fillColor;
  final BorderRadius borderRadius;

  // Padding
  final EdgeInsets outsidePadding;
  final EdgeInsets insidePadding;

  // Border
  final Border? borderStyle;

  const CountrySelector({
    super.key,
    this.primaryColor = StandardFieldStyle.primaryColor,
    this.fillColor = StandardFieldStyle.fillColor,
    this.borderRadius = StandardFieldStyle.borderRadius,

    // Field Name
    required this.onCountrySelected,
    this.fieldName = "Country",
    this.fieldNameColor,
    this.fieldFontSize = StandardFieldStyle.fieldFontSize,
    this.fieldFontWeight = StandardFieldStyle.fieldFontWeight,

    // Hint Text
    this.hintTextColor = StandardFieldStyle.hintTextColor,
    this.hintTextFontSize = StandardFieldStyle.hintTextFontSize,
    this.hintTextFontWeight = StandardFieldStyle.hintTextFontWeight,

    // Icon
    this.iconColor,
    this.iconSize = StandardFieldStyle.iconSize,
    this.showInfoSuffixIcon = true,
    this.outlinedIcon = StandardFieldStyle.outlinedIcon,

    // Flush Bar
    this.showFlushBar = true,
    this.flushBarMessage =
        "You can select a country now. Once your account is created, the country cannot be changed.",
    this.flushBarDurationMessageInSec = 3,
    this.flushBarPosition = FlushbarPosition.TOP,

    // Padding
    this.outsidePadding = StandardFieldStyle.outsidePadding,
    this.insidePadding = const EdgeInsets.only(right: 0, left: 15, top: 10, bottom: 10),

    // Border
    this.borderStyle,
  });

  @override
  CountrySelectorState createState() => CountrySelectorState();
}

class CountrySelectorState extends State<CountrySelector> {
  String selectedCountryName = "Select Country";
  String selectedCountryFlag = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.outsidePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          GestureDetector(
            onTap: () => _displayCountryPicker(),
            child: Container(
              decoration: BoxDecoration(
                color: widget.fillColor,
                borderRadius: widget.borderRadius,
                border: widget.borderStyle ?? StandardFieldStyle.borderStyle,
              ),
              padding: widget.insidePadding,
              height: 47,
              child: Row(
                children: [
                  _displayPrefixIcon(),
                  const SizedBox(width: 15),
                  _displayCountryName(),
                  _displaySelectedCountryFlag(),
                  _displaySuffixIconButton(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }

  Widget _displaySuffixIconButton() {
    return widget.showInfoSuffixIcon
        ? IconButton(
            icon: Icon(widget.outlinedIcon ? Icons.info_outline : Icons.info, color: ThemeColors.primary),
            padding: const EdgeInsets.only(top: 0, left: 0, right: 0),
            onPressed: () => _buildFlushBar(),
          )
        : const SizedBox();
  }

  Widget _buildFlushBar() {
    return Flushbar(
      message: widget.flushBarMessage,
      messageColor: ThemeColors.primary,
      icon: Icon(
        widget.outlinedIcon ? Icons.info : Icons.info_outline,
        size: 28.0,
        color: widget.primaryColor,
      ),
      duration: Duration(seconds: widget.flushBarDurationMessageInSec),
      leftBarIndicatorColor: ThemeColors.primary,
      backgroundColor: ThemeColors.grey_100,
      borderRadius: BorderRadius.circular(15),
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      flushbarPosition: widget.flushBarPosition,
    )..show(context);
  }

  Widget _displayPrefixIcon() {
    return Icon(widget.outlinedIcon ? Icons.flag_outlined : Icons.flag,
        size: widget.iconSize, color: widget.iconColor ?? widget.primaryColor);
  }

  Widget _displayCountryName() {
    return Expanded(
      child: Text(
        selectedCountryName,
        style: selectedCountryName == "Select Country"
            ? TextStyle(
                fontSize: widget.hintTextFontSize,
                color: widget.hintTextColor,
                fontWeight: widget.hintTextFontWeight,
              )
            : TextStyle(
                fontSize: widget.hintTextFontSize,
                color: widget.primaryColor,
                fontWeight: widget.hintTextFontWeight),
      ),
    );
  }

  Widget _displaySelectedCountryFlag() {
    return selectedCountryFlag.isNotEmpty
        ? Text(selectedCountryFlag, style: const TextStyle(fontSize: 18))
        : const SizedBox();
  }

  void _displayCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() {
          selectedCountryName = country.name;
          selectedCountryFlag = country.flagEmoji;
        });
        widget.onCountrySelected(country.name, country.countryCode, country.flagEmoji);
      },
    );
  }
}
