import 'package:flutter/cupertino.dart';
import 'package:intelligentsia_forms/theme_colors.dart';

class StandardFieldStyle {
  /// Global field settings.
  static const Color primaryColor = ThemeColors.primary;
  static const Color fillColor = ThemeColors.backgroundColor;

  /// The label displayed above the field.
  static Color? fieldNameColor;
  static const double fieldFontSize = 15;
  static const FontWeight fieldFontWeight = FontWeight.w500;

  /// Hint text displayed inside the field.
  static const Color hintTextColor = ThemeColors.grey_600;
  static const double hintTextFontSize = 15;
  static const FontWeight hintTextFontWeight = FontWeight.normal;

  /// Icon shown as a prefix and suffix inside the field.
  static Color? iconColor;
  static const double iconSize = 18;
  static IconData? suffixIconData;
  static const bool outlinedIcon = false;

  /// Border styling.
  static Border borderStyle =
      Border.all(color: ThemeColors.transparent, width: 0);
  static const BorderRadius borderRadius =
      BorderRadius.all(Radius.circular(10));
  static const BorderSide enabledBorderSide =
      BorderSide(color: ThemeColors.transparent, width: 0);
  static const BorderSide focusedBorderSide =
      BorderSide(color: ThemeColors.transparent, width: 0);
  static const BorderSide errorBorderSide =
      BorderSide(color: ThemeColors.accent, width: 1.5);
  static const BorderSide focusedErrorBorderSide =
      BorderSide(color: ThemeColors.accent, width: 1.5);

  /// Error messages and styling.
  static const TextStyle errorMessageStyle =
      TextStyle(color: ThemeColors.accent, fontSize: 13);
  static String? emptyFieldErrorMessage;
  static String? invalidFormErrorMessage;

  /// Padding around the field.
  static const EdgeInsets insidePadding =
      EdgeInsets.symmetric(vertical: 10, horizontal: 5);
  static const EdgeInsets outsidePadding =
      EdgeInsets.symmetric(vertical: 0, horizontal: 16);
}
