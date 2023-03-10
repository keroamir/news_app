import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? text;
  Color? color;
  double? size;
  FontWeight? weight;
  TextAlign? align;
  TextDirection? direction;

  CustomText(
      {required this.text,
      this.direction,
      this.align,
      required this.color,
      required this.size,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      textDirection: direction,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
