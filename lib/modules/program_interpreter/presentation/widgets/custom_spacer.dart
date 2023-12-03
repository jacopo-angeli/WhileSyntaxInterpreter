import 'package:flutter/material.dart';

class CustomSpacer extends StatelessWidget {
  final double height;
  const CustomSpacer({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
