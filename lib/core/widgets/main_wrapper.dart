// ignore_for_file: avoid_redundant_argument_values, eol_at_end_of_file

import 'package:flutter/material.dart';
import 'package:weather_program/core/widgets/app_background.dart';
import 'package:weather_program/core/widgets/bottom_nav.dart';
import 'package:weather_program/features/feature_bookmark/presentation/screens/bookmark_screen.dart';
import 'package:weather_program/features/feature_weather/presentation/screens/home_screen.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final List<Widget> pageViewWidget = [
      const HomeScreen(),
       BookmarkScreen(pageController: pageController,),
    ];

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNav(
        controller: pageController,
      ),
      body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AppBackground.getBackGroundImage(),
                  fit: BoxFit.cover,
                )),
            height: height,
            child: PageView(
              controller: pageController,
              children: pageViewWidget,
            )),
    );
  }
}


