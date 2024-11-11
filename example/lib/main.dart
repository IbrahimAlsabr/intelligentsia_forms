import 'package:flutter/material.dart';
import 'package:intelligentsia_forms/intelligentsia_forms.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Intelligentsia Forms'),
          backgroundColor: ThemeColors.bg,
        ),
        backgroundColor: ThemeColors.bg,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // ---#---#---#---#---#---#---#---#---#---#---#
              SmartTextFormField(
                controller: TextEditingController(),
                onChanged: (string) => print("string"),
                formType: FormType.userName,
                primaryColor: Colors.black87,
                enabledBorderSide: const BorderSide(color: ThemeColors.transparent),
              ),

              // ---#---#---#---#---#---#---#---#---#---#---#
              const SmartTextFormField(
                formType: FormType.email,
              ),

              // ---#---#---#---#---#---#---#---#---#---#---#
              const SmartTextFormField(
                formType: FormType.password,
                primaryColor: Colors.black87, // optional
                enabledBorderSide: BorderSide(color: ThemeColors.transparent),
              ),

              // ---#---#---#---#---#---#---#---#---#---#---#
              const SmartTextFormField(formType: FormType.aboutMe),

              // ---#---#---#---#---#---#---#---#---#---#---#
              CountrySelector(onCountrySelected: (countryName, countryCode, countryFlag) {
                print("Country Name: $countryName, Country Code: $countryCode, Country Flag: $countryFlag");
              }),

              // ---#---#---#---#---#---#---#---#---#---#---#
              DateSelector(
                selectedDate: (int year, int month, int day) {
                  print("Selected Date: Year: $year, Month: $month, Day: $day");
                },
              ),

              // ---#---#---#---#---#---#---#---#---#---#---#
              GenderSelector(onGenderSelected: (gender) {
                print("Selected gender : $gender");
              }),
            ],
          ),
        ),
      ),
    );
  }
}
