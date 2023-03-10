import 'package:flutter/material.dart';

import '../../component/customText.dart';
import '../../constant.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Explore",
          color: black,
          size: 26,
          weight: FontWeight.w600,
        ),
        backgroundColor: white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: white,
    );
  }
}
