import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ShortenLinkButton extends StatelessWidget {
  const ShortenLinkButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8CA8FE),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: Text(
        "shorten_Link".tr(),
      ),
    );
  }
}
