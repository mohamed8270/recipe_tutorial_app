// ignore_for_file: non_constant_identifier_names

// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_tutorial_app/components/search_field.dart';
import 'package:recipe_tutorial_app/constants/theme.dart';
import 'package:recipe_tutorial_app/inner%20screens/detail_screen.dart';
import 'package:recipe_tutorial_app/models/food_models.dart';
import 'package:recipe_tutorial_app/screens/category_page.dart';
// import 'package:http/http.dart' as http;
import 'package:recipe_tutorial_app/service/food_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController SearchMealController = TextEditingController();
  MealDB mealdb = Get.put(MealDB());

  @override
  Widget build(BuildContext context) {
    final ScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Fgrey,
      body: RefreshIndicator(
        color: Fgreen,
        onRefresh: () async {
          setState(() {
            mealdb.FetchMealData(SearchMealController.text);
          });
        },
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              elevation: 0,
              toolbarHeight: ScreenSize.height * 0.1,
              automaticallyImplyLeading: false,
              excludeHeaderSemantics: false,
              floating: true,
              pinned: true,
              centerTitle: false,
              snap: false,
              backgroundColor: Fwhite,
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'FOOD',
                      style: GoogleFonts.poppins(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Fgreen,
                      ),
                    ),
                    TextSpan(
                      text: 'DOOR\n',
                      style: GoogleFonts.poppins(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    TextSpan(
                      text: 'Your Food Companion',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Fblack.withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              ),
              bottom: AppBar(
                backgroundColor: Fwhite,
                elevation: 0,
                toolbarHeight: ScreenSize.height * 0.1,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchBarField(
                      ScreenSize: ScreenSize,
                      Controller: SearchMealController,
                      onSearch: (query) {
                        setState(() {
                          SearchMealController.text = query;
                        });
                        mealdb.searchMeals(); // Perform the search
                      },
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          mealdb.searchMeals();
                        });
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: ScreenSize.height * 0.06,
                        width: ScreenSize.width * 0.13,
                        decoration: BoxDecoration(
                          color: Fblack.withOpacity(0.02),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.network(
                            'https://www.svgrepo.com/show/530386/magnifying-glass-find-search.svg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Fblack,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(
                              const CategoryPage(),
                            );
                          },
                          child: Text(
                            "see all",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Fgreen,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder<List<MealModel>>(
                    future: mealdb.FetchMealData(SearchMealController.text),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<MealModel>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              strokeAlign: 3,
                              strokeCap: StrokeCap.round,
                              color: Fgreen,
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            height: ScreenSize.height * 0.4,
                            decoration: const BoxDecoration(
                              color: Fgrey,
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: ScreenSize.height * 0.2,
                                  width: ScreenSize.width * 0.4,
                                  child: SvgPicture.network(
                                    'https://www.svgrepo.com/show/530384/food.svg',
                                  ),
                                ),
                                Text(
                                  "Oh Snap!\nCorrect Your Recipe Name and Try Again",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Fgreen,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: ScreenSize.width * 0.7,
                                  child: Text(
                                    snapshot.error.toString(),
                                    overflow: TextOverflow.fade,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w600,
                                      color: Fblack.withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (snapshot.hasData) {
                        List<MealModel>? foodData = snapshot.data;
                        return Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 18,
                              childAspectRatio:
                                  (ScreenSize.width / ScreenSize.height * 1.4),
                            ),
                            itemCount: foodData!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  await Get.to(
                                    DetailScreen(
                                      recipenumber: index,
                                      searchquery: SearchMealController.text,
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Fwhite,
                                  ),
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: ScreenSize.height * 0.2,
                                        decoration: BoxDecoration(
                                          color: Fwhite,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              foodData[index]
                                                  .mealthumb
                                                  .toString(),
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6, left: 8, right: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width:
                                                      ScreenSize.width * 0.31,
                                                  child: Text(
                                                    foodData[index]
                                                        .mealname
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Fgreen,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  foodData[index]
                                                      .category
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        Fblack.withOpacity(0.3),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: ScreenSize.height * 0.04,
                                              width: ScreenSize.width * 0.1,
                                              decoration: BoxDecoration(
                                                color: Fblack.withOpacity(0.01),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: SvgPicture.network(
                                                  'https://www.svgrepo.com/show/83320/salad.svg',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10, top: 5),
                                        child: Container(
                                          height: ScreenSize.height * 0.04,
                                          decoration: BoxDecoration(
                                            color: Fblack.withOpacity(0.02),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            foodData[index].area.toString(),
                                            style: GoogleFonts.poppins(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Fblack,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Text(
                          "Enter some query or tap on search bar",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Fgreen,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
