import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SnackbarHelper {
  static void showShortenedUrlSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text("URL_shortened_successfully!".tr()),
      ),
    );
  }

  static void showShortenedUrlSnackbarFailure(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text("error_snackbar".tr()),
      ),
    );
  }

  static void showCopiedItemSnackbarSuccess(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(text),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static void showDeleteItemSnackbarSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text("Url_Deleted_Successfully".tr()),
      ),
    );
  }
}
