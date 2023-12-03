import 'package:first_homework/core/themes/app_themes.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? indentation;
  final double? margin;
  final bool isCode;
  final bool errorExample;

  const CustomText(
    this.text, {
    super.key,
    this.style,
    this.indentation,
    this.margin,
    this.isCode = false,
    this.errorExample = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget aux = Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: indentation != null ? indentation as double : 0,
            ),
            child: Text(
              text,
              style: style ?? code,
              softWrap: true,
            ),
          ),
        )
      ],
    );

    if (isCode) {
      return Container(
          margin:
              EdgeInsets.all(indentation != null ? indentation as double : 0.0),
          padding: EdgeInsets.all(margin != null ? margin as double : 10),
          decoration: BoxDecoration(
              color: errorExample ? Colors.red[100] : Colors.grey[200],
              borderRadius: BorderRadius.circular(10)),
          child: aux);
    } else {
      return aux;
    }
  }
}
