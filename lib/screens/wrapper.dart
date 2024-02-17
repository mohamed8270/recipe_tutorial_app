import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:recipe_tutorial_app/components/navbar.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FOODDOOR',
      home: BottomNavBar(),
    );
  }
}
