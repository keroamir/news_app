import 'package:flutter/material.dart';
import 'package:news_app/component/customText.dart';
import 'package:news_app/controller/apiController.dart';

import '../../component/newsCard.dart';
import '../../constant.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Bookmarks",
          color: black,
          size: 26,
          weight: FontWeight.w600,
        ),
        backgroundColor: white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
              child: TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Search in Bookmarks",
                  hintStyle: TextStyle(
                      color: placeHolder,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  filled: true,
                  fillColor: gray,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search, size: 30),
                ),
              ),
            ),
            FutureBuilder(
              future: ApiController.fetchArticles(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return NewsCard(
                        image:
                        "https://thumbs.dreamstime.com/b/news-header-background-title-abstract-colorful-global-map-text-hightech-design-blue-colorful-template-90494676.jpg",
                        title: "BBC",
                        text:
                        "New age firms’ market cap in red since listing",
                        time: "2 hours ago");
                  },);
              },
            )
          ],
        ),
      ),
    );
  }
}
