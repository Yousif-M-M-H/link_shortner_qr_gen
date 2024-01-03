import 'package:flutter/material.dart';

class SnackbarHelper {
  static void showShortenedUrlSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.green,
        content: Text('URL shortened successfully!'),
      ),
    );
  }

  static void showShortenedUrlSnackbarFailure(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Couldn't save the snackbar, Please try again"),
      ),
    );
  }
}
