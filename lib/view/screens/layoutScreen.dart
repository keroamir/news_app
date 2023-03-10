import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/constant.dart';
import 'package:news_app/view/screens/homeScreen.dart';
import 'package:news_app/view/screens/searchScreen.dart';

import 'bookmarkScreen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selected = 0 ;
  List screens = [
    HomeScreen(),
    BookmarkScreen(),
    SearchScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selected],
      bottomNavigationBar: BottomNavigationBar(

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: SvgPicture.asset("$homeDisable"),
              activeIcon: SvgPicture.asset("$homeActive"),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("$exploreDisable"),
              label: '',
              activeIcon: SvgPicture.asset("$exploreActive")),
          BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset("$bookmarkDisable"),
              activeIcon: SvgPicture.asset("$bookmarkActive")),
        ],
        backgroundColor: white,
        onTap: (index) {
          setState(() {
            _selected = index;
          });
        },
        currentIndex: _selected,
        iconSize: 30,
        elevation: 1,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),

    );
  }
}
