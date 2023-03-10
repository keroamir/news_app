import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/component/customText.dart';
import 'package:news_app/view/gridScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../component/pageModel.dart';
import '../constant.dart';
import 'screens/layoutScreen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;
  PageController _controller = PageController();
  List _pages = [
    PageModel(
      image: "assets/images/img1.png",
      text: RichText(
        text: TextSpan(
            text: "Get the latest news from\n",
            style: TextStyle(
              fontSize: 42,
              color: white,
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: "reliable \nsources",
                style: TextStyle(
                  fontSize: 42,
                  color: mainColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
      ),
    ),
    PageModel(
      image: "assets/images/img2.png",
      text: RichText(
        text: TextSpan(
          text: "Still",
          style: TextStyle(
            fontSize: 42,
            color: white,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: " up to date\n",
              style: TextStyle(
                fontSize: 42,
                color: mainColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: "news from all around the world",
              style: TextStyle(
                fontSize: 42,
                color: white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ),
    PageModel(
      image: "assets/images/img3.png",
      text: RichText(
        text: TextSpan(
          text: "From art to politics, ",
          style: TextStyle(
            fontSize: 42,
            color: white,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: " anything",
              style: TextStyle(
                fontSize: 42,
                color: mainColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: " in Observer ",
              style: TextStyle(
                fontSize: 42,
                color: white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(smallLogo),
                GestureDetector(
                  child: CustomText(
                      text: "Skip",
                      color: subText,
                      size: 14,
                      weight: FontWeight.w500),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LayoutScreen();
                    }));
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 8),
            child: Stack(
              children: [
                Container(
                  height: 600,
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: _pages.length,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemBuilder: (context, index) {
                      return _pages[index];
                    },
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 32,
                  child: Container(
                    width: 112,
                    alignment: Alignment.bottomCenter,
                    child: AnimatedSmoothIndicator(
                      activeIndex: _currentPage,
                      count: _pages.length,
                      effect: ColorTransitionEffect(),
                    ),
                  ),
                ),
              ],
            ),
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
                      return GridScreen();
                    }),
                  );
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: CustomText(
                  text: "Next",
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
