import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/constant.dart';
import 'package:news_app/view/onBoarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: SvgPicture.asset(largeLogo),
        duration: 3000,
        backgroundColor: white,
        centered: true,

        nextScreen: OnBoarding());
  }
}
