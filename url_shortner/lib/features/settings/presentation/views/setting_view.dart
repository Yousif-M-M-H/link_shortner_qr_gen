import 'package:flutter/material.dart';
import 'package:url_shortner/features/settings/presentation/views/widgets/settings_view_body.dart';

class SettingPageView extends StatelessWidget {
  const SettingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: const SettingsViewBody(),
    );
  }
}
