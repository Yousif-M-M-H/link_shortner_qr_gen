import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class UrlTextField extends StatelessWidget {
  const UrlTextField({
    Key? key,
    required this.longUrlController,
  }) : super(key: key);

  final TextEditingController longUrlController;

  String? _validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return "Please_enter_a_URL".tr();
    }

    final validUrl = ValidationBuilder().url().build()(value);
    if (validUrl != null) {
      return "Please_enter_a_valid_URL".tr();
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: _validateUrl,
      controller: longUrlController,
      decoration: InputDecoration(
        hintText: "enterUrl".tr(),
        prefixIcon: const Icon(Icons.link),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
