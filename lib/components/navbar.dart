import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_tutorial_app/constants/theme.dart';
import 'package:recipe_tutorial_app/screens/category_page.dart';
import 'package:recipe_tutorial_app/screens/home_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int CurrentIndex = 0;
  final Screens = [
    const HomePage(),
    const CategoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[CurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Fwhite,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: CurrentIndex,
        onTap: (index) => setState(() => CurrentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.network(
              'https://www.svgrepo.com/show/530384/food.svg',
              // color: Fgreen,
              height: 26,
              width: 26,
            ),
            activeIcon: SvgPicture.network(
              'https://www.svgrepo.com/show/530384/food.svg',
              // color: Fgreen,
              height: 26,
              width: 26,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.network(
              'https://www.svgrepo.com/show/530377/chat-chat.svg',
              // color: Fgreen,
              height: 26,
              width: 26,
            ),
            activeIcon: SvgPicture.network(
              'https://www.svgrepo.com/show/530377/chat-chat.svg',
              // color: Fgreen,
              height: 26,
              width: 26,
            ),
            label: 'Category',
          ),
        ],
      ),
    );
  }
}
