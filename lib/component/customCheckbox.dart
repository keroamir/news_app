import 'package:flutter/material.dart';
import 'package:news_app/constant.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({Key? key}) : super(key: key);

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isChecked ? white : Colors.white.withOpacity(.2),
        ),
        child: isChecked ? Icon(Icons.check, color: mainColor) : Container(),
      ),
    );
  }
}
