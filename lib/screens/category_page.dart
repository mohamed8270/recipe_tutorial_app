import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_tutorial_app/constants/theme.dart';
import 'package:recipe_tutorial_app/models/category_model.dart';
import 'package:recipe_tutorial_app/service/food_service.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  MealDB mealcat = Get.put(MealDB());

  @override
  Widget build(BuildContext context) {
    final ScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Fgrey,
      body: RefreshIndicator(
        color: Fgreen,
        onRefresh: () async {
          setState(() {
            mealcat.FetchMealCategoryData();
          });
        },
        child: CustomScrollView(
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
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  FutureBuilder<List<CategoryModel>>(
                    future: mealcat.FetchMealCategoryData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<CategoryModel>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          heightFactor: 30,
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
                        List<CategoryModel>? mealcatdata = snapshot.data;
                        return SizedBox(
                          height: ScreenSize.height * 0.8,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: ListView.builder(
                              itemCount: mealcatdata!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    // height: ScreenSize.height * 0.15,
                                    width: ScreenSize.width * 0.7,
                                    decoration: BoxDecoration(
                                      color: Fwhite,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: ScreenSize.height * 0.15,
                                            width: ScreenSize.width * 0.3,
                                            decoration: BoxDecoration(
                                              color: Fwhite,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  mealcatdata[index]
                                                      .categorythumb,
                                                ),
                                                fit: BoxFit.contain,
                                                filterQuality:
                                                    FilterQuality.high,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    height: 20,
                                                    child: VerticalDivider(
                                                      color: Colors.orange,
                                                      width: 6,
                                                      thickness: 3,
                                                    ),
                                                  ),
                                                  const Gap(10),
                                                  Text(
                                                    mealcatdata[index]
                                                        .categoryname,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.orange,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Gap(20),
                                              SizedBox(
                                                width: ScreenSize.width * 0.57,
                                                child: Text(
                                                  mealcatdata[index]
                                                      .categorydescription,
                                                  textAlign: TextAlign.justify,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        Fblack.withOpacity(0.3),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
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
