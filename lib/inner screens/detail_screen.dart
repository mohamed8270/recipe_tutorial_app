import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_tutorial_app/components/ingre_repo.dart';
import 'package:recipe_tutorial_app/constants/theme.dart';
import 'package:recipe_tutorial_app/inner%20screens/source_webview.dart';
import 'package:recipe_tutorial_app/models/food_models.dart';
import 'package:recipe_tutorial_app/screens/youtube_screen.dart';
import 'package:recipe_tutorial_app/service/food_service.dart';
// import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final int recipenumber;
  final String searchquery;
  const DetailScreen({
    super.key,
    required this.recipenumber,
    required this.searchquery,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  MealDB mealservice = Get.put(MealDB());

  @override
  Widget build(BuildContext context) {
    final ScreenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Fwhite,
      appBar: AppBar(
        backgroundColor: Fwhite,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            navigator!.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Fgreen,
            size: 26,
          ),
        ),
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
                text: 'DOOR',
                style: GoogleFonts.poppins(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<MealModel>>(
        future: mealservice.FetchMealData(widget.searchquery),
        builder:
            (BuildContext context, AsyncSnapshot<List<MealModel>> snapshot) {
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
            List<MealModel>? foodDB = snapshot.data;
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                          foodDB![widget.recipenumber].category.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.orange,
                          ),
                        )
                      ],
                    ),
                    const Gap(20),
                    SizedBox(
                      width: 260,
                      child: Text(
                        foodDB[widget.recipenumber].mealname.toString(),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                        style: GoogleFonts.poppins(
                          fontSize: 40,
                          height: 0.9,
                          fontWeight: FontWeight.w700,
                          color: Fblack,
                        ),
                      ),
                    ),
                    const Gap(8),
                    Row(
                      children: [
                        Container(
                          height: ScreenSize.height * 0.04,
                          width: ScreenSize.width * 0.28,
                          decoration: BoxDecoration(
                            color: Fgrey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: SvgPicture.network(
                                  'https://www.svgrepo.com/show/220443/location-compass.svg',
                                ),
                              ),
                              const Gap(10),
                              Text(
                                foodDB[widget.recipenumber].area.toString(),
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Fblack.withOpacity(0.3),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(10),
                        InkWell(
                          onTap: () async {
                            Get.to(
                              SourceWeview(
                                newsUrl: foodDB[widget.recipenumber]
                                    .source
                                    .toString(),
                              ),
                            );
                            // await launchUrl(
                            //   Uri.parse(
                            //     foodDB[widget.recipenumber].source.toString(),
                            //   ),
                            // );
                          },
                          child: Container(
                            height: ScreenSize.height * 0.04,
                            width: ScreenSize.width * 0.24,
                            decoration: BoxDecoration(
                              color: Fgrey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 21,
                                  width: 21,
                                  child: SvgPicture.network(
                                    'https://www.svgrepo.com/show/477058/internet.svg',
                                  ),
                                ),
                                const Gap(10),
                                Text(
                                  "Source",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Fblack.withOpacity(0.3),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(30),
                    Text(
                      "Let's make it! Step by step",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Fblack,
                      ),
                    ),
                    const Gap(10),
                    InkWell(
                      onTap: () {
                        Get.to(
                          YouTubeScreen(
                            YTurl:
                                foodDB[widget.recipenumber].youtube.toString(),
                            des: foodDB[widget.recipenumber]
                                .introduction
                                .toString(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            height: ScreenSize.height * 0.16,
                            width: ScreenSize.width * 0.4,
                            decoration: BoxDecoration(
                              color: Fgrey,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  foodDB[widget.recipenumber]
                                      .mealthumb
                                      .toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              height: ScreenSize.height * 0.16,
                              width: ScreenSize.width * 0.4,
                              decoration: BoxDecoration(
                                color: Fblack.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.play_arrow_rounded,
                                color: Fwhite,
                                size: 42,
                              ),
                            ),
                          ),
                          const Gap(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: ScreenSize.height * 0.03,
                                width: ScreenSize.width * 0.14,
                                decoration: const BoxDecoration(
                                  color: Fwhite,
                                ),
                                alignment: Alignment.center,
                                child: SvgPicture.network(
                                  'https://www.svgrepo.com/show/354594/youtube.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: ScreenSize.width * 0.5,
                                child: Text(
                                  foodDB[widget.recipenumber]
                                      .mealname
                                      .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Fblack,
                                  ),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: foodDB[widget.recipenumber]
                                          .area
                                          .toString(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Fblack.withOpacity(0.3),
                                      ),
                                    ),
                                    const TextSpan(text: ", "),
                                    TextSpan(
                                      text: foodDB[widget.recipenumber]
                                          .category
                                          .toString(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Fblack.withOpacity(0.3),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(5),
                              SizedBox(
                                height: ScreenSize.height * 0.06,
                                width: ScreenSize.width * 0.5,
                                child: Text(
                                  foodDB[widget.recipenumber]
                                      .introduction
                                      .toString(),
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.poppins(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                    color: Fblack.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Gap(30),
                    Text(
                      "Ingredient's",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Fblack,
                      ),
                    ),
                    const Gap(5),
                    Row(
                      children: [
                        SizedBox(
                          height: 14,
                          width: 14,
                          child: SvgPicture.network(
                            'https://www.svgrepo.com/show/502908/warning.svg',
                            color: Fblack.withOpacity(0.2),
                          ),
                        ),
                        const Gap(4),
                        Text(
                          "Aware, All the Ingredients are placed",
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Fblack.withOpacity(0.2),
                          ),
                        ),
                      ],
                    ),
                    const Gap(15),
                    IngredientMsr(
                      ScreenSize: ScreenSize,
                      ingre01:
                          foodDB[widget.recipenumber].ingredient01.toString(),
                      msr01: foodDB[widget.recipenumber]
                          .ingredientmsr01
                          .toString(),
                      ingre02:
                          foodDB[widget.recipenumber].ingredient02.toString(),
                      msr02: foodDB[widget.recipenumber]
                          .ingredientmsr02
                          .toString(),
                      ingre03:
                          foodDB[widget.recipenumber].ingredient03.toString(),
                      msr03: foodDB[widget.recipenumber]
                          .ingredientmsr03
                          .toString(),
                      ingre04:
                          foodDB[widget.recipenumber].ingredient04.toString(),
                      msr04: foodDB[widget.recipenumber]
                          .ingredientmsr04
                          .toString(),
                      ingre05:
                          foodDB[widget.recipenumber].ingredient05.toString(),
                      msr05: foodDB[widget.recipenumber]
                          .ingredientmsr05
                          .toString(),
                    ),
                    const Gap(30),
                    IngredientMsr(
                      ScreenSize: ScreenSize,
                      ingre01:
                          foodDB[widget.recipenumber].ingredient06.toString(),
                      msr01: foodDB[widget.recipenumber]
                          .ingredientmsr06
                          .toString(),
                      ingre02:
                          foodDB[widget.recipenumber].ingredient07.toString(),
                      msr02: foodDB[widget.recipenumber]
                          .ingredientmsr07
                          .toString(),
                      ingre03:
                          foodDB[widget.recipenumber].ingredient08.toString(),
                      msr03: foodDB[widget.recipenumber]
                          .ingredientmsr08
                          .toString(),
                      ingre04:
                          foodDB[widget.recipenumber].ingredient09.toString(),
                      msr04: foodDB[widget.recipenumber]
                          .ingredientmsr09
                          .toString(),
                      ingre05:
                          foodDB[widget.recipenumber].ingredient10.toString(),
                      msr05: foodDB[widget.recipenumber]
                          .ingredientmsr10
                          .toString(),
                    ),
                    const Gap(30),
                    IngredientMsr(
                      ScreenSize: ScreenSize,
                      ingre01:
                          foodDB[widget.recipenumber].ingredient11.toString(),
                      msr01: foodDB[widget.recipenumber]
                          .ingredientmsr11
                          .toString(),
                      ingre02:
                          foodDB[widget.recipenumber].ingredient12.toString(),
                      msr02: foodDB[widget.recipenumber]
                          .ingredientmsr12
                          .toString(),
                      ingre03:
                          foodDB[widget.recipenumber].ingredient13.toString(),
                      msr03: foodDB[widget.recipenumber]
                          .ingredientmsr13
                          .toString(),
                      ingre04:
                          foodDB[widget.recipenumber].ingredient14.toString(),
                      msr04: foodDB[widget.recipenumber]
                          .ingredientmsr14
                          .toString(),
                      ingre05:
                          foodDB[widget.recipenumber].ingredient15.toString(),
                      msr05: foodDB[widget.recipenumber]
                          .ingredientmsr15
                          .toString(),
                    ),
                    const Gap(30),
                    IngredientMsr(
                      ScreenSize: ScreenSize,
                      ingre01:
                          foodDB[widget.recipenumber].ingredient16.toString(),
                      msr01: foodDB[widget.recipenumber]
                          .ingredientmsr16
                          .toString(),
                      ingre02:
                          foodDB[widget.recipenumber].ingredient17.toString(),
                      msr02: foodDB[widget.recipenumber]
                          .ingredientmsr17
                          .toString(),
                      ingre03:
                          foodDB[widget.recipenumber].ingredient18.toString(),
                      msr03: foodDB[widget.recipenumber]
                          .ingredientmsr18
                          .toString(),
                      ingre04:
                          foodDB[widget.recipenumber].ingredient19.toString(),
                      msr04: foodDB[widget.recipenumber]
                          .ingredientmsr19
                          .toString(),
                      ingre05:
                          foodDB[widget.recipenumber].ingredient20.toString(),
                      msr05: foodDB[widget.recipenumber]
                          .ingredientmsr20
                          .toString(),
                    ),
                  ],
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
    );
  }
}
