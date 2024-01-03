import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({Key? key}) : super(key: key);

  @override
  _SettingsViewBodyState createState() => _SettingsViewBodyState();
}

class _SettingsViewBodyState extends State<SettingsViewBody> {
  String selectedLanguage = 'en';

  void _changeLanguage(String languageCode) {
    setState(() {
      selectedLanguage = languageCode;
      context.setLocale(Locale(languageCode));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            title: Text("Change_Language".tr()),
            trailing: DropdownButton<String>(
              value: selectedLanguage,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  _changeLanguage(newValue);
                }
              },
              items: <String>['en', 'ar'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value == 'en' ? "english".tr() : "arabic".tr()),
                );
              }).toList(),
            ),
          ),
          // Add other settings widgets here
        ],
      ),
    );
  }
}
