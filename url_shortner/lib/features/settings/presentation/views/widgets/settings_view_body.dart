import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_shortner/core/errors/enums/theme_state.dart';
import 'package:url_shortner/features/theme_cubit/app_theme_cubit.dart';

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
          ListTile(
            title: Text("change_Theme".tr()),
            trailing: BlocBuilder<AppThemeCubit, AppThemeState>(
              builder: (context, themeState) {
                return Switch(
                  value: themeState is AppThemeDark,
                  onChanged: (value) {
                    final themeCubit = context.read<AppThemeCubit>();
                    themeCubit.changeTheme(
                      value ? ThemeState.dark : ThemeState.light,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
