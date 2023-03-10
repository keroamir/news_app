import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/component/customText.dart';
import 'package:news_app/component/newsCard.dart';
import 'package:news_app/controller/apiController.dart';

import '../../constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: SvgPicture.asset("$smallLogo"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: black,
                size: 25,
              ))
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: ApiController.fetchArticles(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: CarouselSlider.builder(
                    itemCount: 4,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "https://thumbs.dreamstime.com/b/news-header-background-title-abstract-colorful-global-map-text-hightech-design-blue-colorful-template-90494676.jpg",
                              height: MediaQuery.of(context).size.height / 2,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                              bottom: 20,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Card(
                                      margin: EdgeInsets.all(5),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          "BBC",
                                          style: TextStyle(
                                              color: white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ),
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    Card(
                                      margin: EdgeInsets.all(5),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: CustomText(
                                          text:
                                              'World Cup 2022: An explosion of joy as Argentina wins',
                                          color: white,
                                          size: 16,
                                          weight: FontWeight.w600,
                                        ),
                                      ),
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      );
                    },
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 300),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 24, bottom: 8),
              child: CustomText(
                text: "Business",
                color: black,
                size: 22,
                weight: FontWeight.w600,
                align: TextAlign.start,
              ),
            ),
            FutureBuilder(
              future: ApiController.fetchArticlesCategory("Business"),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsCard(
                          image:
                              "https://thumbs.dreamstime.com/b/news-header-background-title-abstract-colorful-global-map-text-hightech-design-blue-colorful-template-90494676.jpg",
                          title: "BBC",
                          text:
                              "New age firms’ market cap in red since listing",
                          time: "2 hours ago");
                    });
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    CustomText(
                        text: "More from Business",
                        color: black,
                        size: 14,
                        weight: FontWeight.w500),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset("assets/icons/Rightcircle.svg")
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 24, bottom: 8),
              child: CustomText(
                text: "Sports",
                color: black,
                size: 22,
                weight: FontWeight.w600,
                align: TextAlign.start,
              ),
            ),
            FutureBuilder(
              future: ApiController.fetchArticlesCategory("sports"),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsCard(
                          image:
                              "https://thumbs.dreamstime.com/b/news-header-background-title-abstract-colorful-global-map-text-hightech-design-blue-colorful-template-90494676.jpg",
                          title: "BBC",
                          text:
                              "New age firms’ market cap in red since listing",
                          time: "2 hours ago");
                    });
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    CustomText(
                        text: "More from Sports",
                        color: black,
                        size: 14,
                        weight: FontWeight.w500),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset("assets/icons/Rightcircle.svg")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
