import 'package:first_homework/core/themes/app_themes.dart';
import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String text;
  const CustomLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          text,
          style: labelStyle,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
