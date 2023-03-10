import 'package:flutter/material.dart';
import 'package:news_app/component/customText.dart';
import 'package:news_app/constant.dart';

class NewsCard extends StatelessWidget {
  String image;
  String title;
  String text;
  String time;

  NewsCard(
      {required this.image,
      required this.title,
      required this.text,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  (image == null)
                      ? "https://freefrontend.com/assets/img/tailwind-404-page-templates/404-page-not-found.png"
                      : "$image",
                  width: 80,
                  height: MediaQuery.of(context).size.height / 10,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: (title == null) ? "No Data" : "$title",
                      color: black,
                      size: 12,
                      weight: FontWeight.w500),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: CustomText(
                        text: (text == null) ? "No Data" : "$text",
                        color: black,
                        size: 14,
                        weight: FontWeight.w600,
                        direction: TextDirection.ltr),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.centerRight,
                      child: CustomText(
                          align: TextAlign.right,
                          text: (time == null) ? "No Data" : "$time",
                          color: subText,
                          size: 12,
                          weight: FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
