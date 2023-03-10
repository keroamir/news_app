import 'package:flutter/material.dart';
import 'package:news_app/component/customText.dart';
import 'package:news_app/component/gridCard.dart';
import 'package:news_app/constant.dart';
import 'package:news_app/view/screens/layoutScreen.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({Key? key}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 8),
            alignment: Alignment.center,
            child: CustomText(
                align: TextAlign.center,
                text: "What’s interest you?",
                color: black,
                size: 26,
                weight: FontWeight.w600),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 32),
            child: RichText(
              text: TextSpan(
                text: "Pick ",
                style: TextStyle(
                  color: subText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: "topics  ",
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: "to start reading and saving news",
                    style: TextStyle(
                      color: subText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GridView.extent(
            shrinkWrap: true,
            maxCrossAxisExtent: 200,
            padding: EdgeInsets.symmetric(horizontal: 28),
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            children: [
              GridCard(title: "Technology", image: "assets/images/card1.png"),
              GridCard(title: "Science", image: "assets/images/card2.png"),
              GridCard(title: "Politics", image: "assets/images/card3.png"),
              GridCard(title: "Food", image: "assets/images/card4.png"),
              GridCard(title: "Business", image: "assets/images/card5.png"),
              GridCard(title: "Health", image: "assets/images/card6.png"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(mainColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return LayoutScreen();
                    }),
                  );
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: CustomText(
                  text: "Get Started",
                  color: white,
                  size: 18,
                  weight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
