import 'package:flutter/material.dart';

class PageModel extends StatelessWidget {
  String image;
  RichText text;

  PageModel({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
           Image.asset("$image"),

          Positioned(
            child: text,
            bottom: 60,
            top: 300,
            right: 16,
            left: 16,
            ),
        ],
      ),
    );
  }
}
