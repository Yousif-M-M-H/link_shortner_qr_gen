import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UrlTextField extends StatelessWidget {
  const UrlTextField({
    super.key,
    required this.longUrlController,
  });

  final TextEditingController longUrlController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: longUrlController,
      decoration: InputDecoration(
        hintText: "enterUrl".tr(),
        suffixIcon: const Icon(Icons.copy),
        prefixIcon: const Icon(Icons.link),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
