import 'package:flutter/material.dart';

import '../constant.dart';
import 'customCheckbox.dart';
import 'customText.dart';

class GridCard extends StatelessWidget {
  String title;
  String image;


  GridCard({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.only(bottom: 14),
            alignment: Alignment.bottomCenter,
            child: CustomText(
                text: title,
                color: white,
                size: 18,
                weight: FontWeight.w600)),
        Positioned(child: CustomCheckbox(), top: 8,right: 8,)
      ],
    );
  }
}
