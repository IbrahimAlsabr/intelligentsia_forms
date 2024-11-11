# `intelligentsia_forms` Package

The `intelligentsia_forms` package for Flutter provides a robust toolkit to create customizable sign-in and sign-up
forms. It includes components for various form fields such as Email, Name, Password, About Me, Country, Birth Date, and
Gender. Each component supports extensive customization options, including color, font, icon, and layout styling, to
give users a tailored experience.

![SmartTextFormField](https://github.com/IbrahimAlsabr/intelligentsia_forms/raw/main/example/assets/all.png)

## Key Features

- Highly customizable components for creating user-friendly forms.
- Flexible styling options to fit any design theme.
- Easy handling of user-input data, including validation and data processing.
- Pre-built components for standard form fields to simplify development.

---

# Component Documentation

### `SmartTextFormField`

The `SmartTextFormField` widget is a versatile text field component designed for fields like email, password, username,
and "About Me." Each field type comes with specialized settings to enhance usability.

#### Features

1. **Form Type-Specific Customization**
    - Placeholder text, icons, validation, and keyboard types adapt based on the selected `formType` (`email`
      , `password`, `aboutMe`, or `userName`).
    - Form-specific settings, like toggling password visibility.

2. **Field Label Customization**
    - Customize the label's color, font size, and font weight for distinct appearances.

3. **Hint Text Styling**
    - Set custom hint text color, font size, and font weight.

4. **Icon Options**
    - Configurable prefix and suffix icons with options for outlined icons.
    - Control icon color and size for consistent design.

5. **Border Styling**
    - Adjustable border radius and color settings for various states (enabled, focused, error).

6. **Error Message Styling**
    - Customizable error message styling for clear user feedback.

7. **Flexible Padding Options**
    - Separate padding options inside and outside the field.

8. **Data Control**
    - Supports custom `TextEditingController` and `onChanged` handlers.
    - Limits on maximum and minimum lines for fields like “About Me.”

9. **Global Styling**
    - Options to set background fill color and primary color.

10. **Password Toggle**
    - For `password` fields, a suffix icon toggles password visibility.

### Standard Style

![SmartTextFormField](https://github.com/IbrahimAlsabr/intelligentsia_forms/raw/main/example/assets/smart_text_form_field_standart.png)

![SmartTextFormField](https://github.com/IbrahimAlsabr/intelligentsia_forms/raw/main/example/assets/smart_text_form_field_filled.png)

![SmartTextFormField](https://github.com/IbrahimAlsabr/intelligentsia_forms/raw/main/example/assets/smart_text_form_field_error.png)

---

### `CountrySelector`

The `CountrySelector` widget lets users pick a country, displaying the selected country’s name and flag.

#### Features

1. **Country Selection Callback**
    - Calls a function (`onCountrySelected`) with the selected country’s name, code, and flag.

2. **Customizable Field Label**
    - Customize the label displayed above the field (text color, font size, and weight).

3. **Hint Text Styling**
    - Adjust the hint text's color, font size, and weight.

4. **Icon Customization**
    - Configurable prefix and suffix icons (e.g., flag and info icons).
    - Option to enable or disable an `info` suffix icon.

5. **Flush Bar Notifications**
    - Optional `Flushbar` message displayed when the info icon is tapped, with customizable content, duration, and
      position.

6. **Global and Border Styling**
    - Set the primary color, fill color, border radius, and border style.

7. **Padding Control**
    - Separate options for inside and outside padding.

8. **Country Display**
    - Displays the selected country name and flag in the field, with styling for unselected and selected states.

9. **Country Picker Integration**
    - Allows browsing and selecting a country via a modal picker.

### Standard Style

![SmartTextFormField](https://github.com/IbrahimAlsabr/intelligentsia_forms/raw/main/example/assets/country_selector_standart.png)

![SmartTextFormField](https://github.com/IbrahimAlsabr/intelligentsia_forms/raw/main/example/assets/list.png)

![SmartTextFormField](https://github.com/IbrahimAlsabr/intelligentsia_forms/raw/main/example/assets/country_selector_selected.png)

![SmartTextFormField](https://github.com/IbrahimAlsabr/intelligentsia_forms/raw/main/example/assets/info.png)
---

### `DateSelector`

The `DateSelector` widget provides a date picker for selecting and displaying dates.

#### Features

1. **Date Selection Callback**
    - Calls a function (`selectedDate`) with the selected date’s year, month, and day.

2. **Field Label Customization**
    - Adjustable label color, font size, and font weight.

3. **Hint Text Styling**
    - Custom hint text styling displayed inside the field when no date is selected.

4. **Icon Customization**
    - Configurable prefix icon (calendar icon) with color, size, and outlined style.

5. **Padding and Border Styling**
    - Inside and outside padding options and customizable border style.

6. **Date Constraints**
    - Minimum and maximum date settings to restrict selection range.

7. **Selected Date Display**
    - Displays the chosen date in a formatted style.

8. **Date Picker Integration**
    - Opens a date picker modal with custom primary and fill colors.

### Standard Style

![SmartTextFormField](https://github.com/IbrahimAlsabr/intelligentsia_forms/raw/main/example/assets/date_selector_standart.png)

![SmartTextFormField](https://github.com/IbrahimAlsabr/intelligentsia_forms/raw/main/example/assets/date_selector_calend.png)

![SmartTextFormField](https://github.com/IbrahimAlsabr/intelligentsia_forms/raw/main/example/assets/date_selector_selected.png)
---

### `GenderSelector`

The `GenderSelector` widget lets users select gender from customizable options.

#### Features

1. **Gender Selection Callback**
    - Calls `onGenderSelected` function with the chosen gender.

2. **Customizable Field Label**
    - Adjustable label color, font size, and weight.

3. **Flexible Gender Options**
    - Customizable list of gender choices (default is `['Male', 'Female']`).

4. **Text Styling for Options**
    - Customizable font size and dynamic color based on selection state.

5. **Color and Border Styling**
    - Configurable primary color, font color, background fill, and border radius.

6. **Interactive Gender Selection**
    - Gender options behave as interactive buttons, with distinct styling for selected options.

![SmartTextFormField](https://github.com/IbrahimAlsabr/intelligentsia_forms/raw/main/example/assets/gender.png)
---

## Installation

Add `intelligentsia_forms` to your `pubspec.yaml`:

```yaml
dependencies:
  intelligentsia_forms: ^latest_version
```

## Note

The `CountrySelector` widget uses the `Flushbar` package for displaying notifications. Ensure the `another_flushbar`
dependency is added to your project.
`ThemeColors` is a custom color class. Replace it with your app's color theme as needed.

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  another_flushbar: ^1.10.0
  country_picker: ^2.0.9
```
