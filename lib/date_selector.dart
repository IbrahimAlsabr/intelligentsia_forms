import 'package:flutter/material.dart';
import 'package:intelligentsia_forms/standard_field_style.dart';

class DateSelector extends StatefulWidget {
  final Function(int year, int month, int day) selectedDate;

  final Color primaryColor;
  final Color fillColor;

  /// The label displayed above the field.
  final String fieldName;
  final Color? fieldNameColor;
  final double fieldFontSize;
  final FontWeight fieldFontWeight;

  /// Hint text displayed inside the field.
  final String hintText;
  final Color hintTextColor;
  final double hintTextFontSize;
  final FontWeight hintTextFontWeight;

  /// Icon shown as a prefix and suffix inside the field.
  final Color? iconColor;
  final double iconSize;
  final bool outlinedIcon;

  // Padding
  final EdgeInsets insidePadding;
  final EdgeInsets outsidePadding;

  // Borders
  final BorderRadius borderRadius;
  final BoxBorder? borderStyle;

  // Date
  final DateTime? minDate;
  final DateTime? maxDate;

  const DateSelector({
    super.key,
    required this.selectedDate,

    this.primaryColor = StandardFieldStyle.primaryColor,
    this.fillColor = StandardFieldStyle.fillColor,

    // Field Name
    this.fieldName = "Date of Birth",
    this.fieldNameColor,
    this.fieldFontSize = StandardFieldStyle.fieldFontSize,
    this.fieldFontWeight = StandardFieldStyle.fieldFontWeight,

    // Hint Text
    this.hintText = "Select your birth date",
    this.hintTextColor = StandardFieldStyle.hintTextColor,
    this.hintTextFontSize = StandardFieldStyle.hintTextFontSize,
    this.hintTextFontWeight = StandardFieldStyle.hintTextFontWeight,

    // Prefix Icon
    this.iconColor,
    this.iconSize = StandardFieldStyle.iconSize,
    this.outlinedIcon = StandardFieldStyle.outlinedIcon,

    // Padding
    this.insidePadding = StandardFieldStyle.insidePadding,
    this.outsidePadding = StandardFieldStyle.outsidePadding,

    // Borders
    this.borderRadius = StandardFieldStyle.borderRadius,
    this.borderStyle,

    // Date
    this.minDate,
    this.maxDate,
  });

  @override
  DateSelectorState createState() => DateSelectorState();
}

class DateSelectorState extends State<DateSelector> {
  DateTime? _selectedDate;

  late final DateTime minDate;
  late final DateTime maxDate;
  late final DateTime initialDate;

  @override
  void initState() {
    super.initState();

    DateTime now = DateTime.now();
    minDate = widget.minDate ?? DateTime(1925);
    maxDate = widget.maxDate ?? DateTime(now.year - 5, now.month, now.day);
    initialDate = now.isBefore(maxDate) ? now : maxDate;
  }

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
          SizedBox(
            width: double.infinity,
            child: InkWell(
              onTap: () => _selectDate(context),
              child: Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: widget.fillColor,
                  borderRadius: widget.borderRadius,
                  border: widget.borderStyle ?? StandardFieldStyle.borderStyle,
                ),
                child: Row(
                  children: [
                    _displayPrefixIcon(),
                    const SizedBox(width: 15),
                    Expanded(
                      child: _selectedDate != null ? _displaySelectedDate() : _displayHintText(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }

  Widget _displaySelectedDate() {
    return Text(
      "${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}",
      style: TextStyle(color: widget.primaryColor, fontWeight: FontWeight.w500),
    );
  }

  Widget _displayHintText() {
    return Text(
      widget.hintText,
      style: TextStyle(
        color: widget.hintTextColor,
        fontWeight: widget.hintTextFontWeight,
        fontSize: widget.hintTextFontSize,
      ),
    );
  }

  Widget _displayPrefixIcon() {
    return Icon(
      widget.outlinedIcon ? Icons.calendar_today : Icons.calendar_month,
      size: widget.iconSize,
      color: widget.iconColor ?? widget.primaryColor,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: minDate,
      lastDate: maxDate,
      builder: (BuildContext context, Widget? child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Theme(
            data: ThemeData.light().copyWith(
              primaryColor: widget.primaryColor,
              colorScheme: ColorScheme.light(
                primary: widget.primaryColor,
                onPrimary: widget.fillColor,
                surface: widget.fillColor,
                onSurface: widget.primaryColor,
              ),
            ),
            child: child!,
          ),
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
    widget.selectedDate(_selectedDate!.year, _selectedDate!.month, _selectedDate!.day);
  }
}
