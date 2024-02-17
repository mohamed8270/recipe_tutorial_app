import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_tutorial_app/constants/theme.dart';

class IngredientMsr extends StatelessWidget {
  const IngredientMsr({
    super.key,
    required this.ScreenSize,
    required this.ingre01,
    required this.ingre02,
    required this.ingre03,
    required this.ingre04,
    required this.ingre05,
    required this.msr01,
    required this.msr02,
    required this.msr03,
    required this.msr04,
    required this.msr05,
  });

  final Size ScreenSize;
  final String ingre01;
  final String ingre02;
  final String ingre03;
  final String ingre04;
  final String ingre05;
  final String msr01;
  final String msr02;
  final String msr03;
  final String msr04;
  final String msr05;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
            child: VerticalDivider(
              thickness: 3,
              color: Colors.orange,
              width: 3,
            ),
          ),
          const Gap(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: ScreenSize.height * 0.07,
                width: ScreenSize.width * 0.2,
                decoration: BoxDecoration(
                  color: Fgrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  ingre01,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Fblack,
                  ),
                ),
              ),
              const Gap(5),
              Text(
                msr01,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Fgreen,
                ),
              ),
            ],
          ),
          const Gap(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: ScreenSize.height * 0.07,
                width: ScreenSize.width * 0.2,
                decoration: BoxDecoration(
                  color: Fgrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  ingre02,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Fblack,
                  ),
                ),
              ),
              const Gap(5),
              Text(
                msr02,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Fgreen,
                ),
              ),
            ],
          ),
          const Gap(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: ScreenSize.height * 0.07,
                width: ScreenSize.width * 0.2,
                decoration: BoxDecoration(
                  color: Fgrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  ingre03,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Fblack,
                  ),
                ),
              ),
              const Gap(5),
              Text(
                msr03,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Fgreen,
                ),
              ),
            ],
          ),
          const Gap(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: ScreenSize.height * 0.07,
                width: ScreenSize.width * 0.2,
                decoration: BoxDecoration(
                  color: Fgrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  ingre04,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Fblack,
                  ),
                ),
              ),
              const Gap(5),
              Text(
                msr04,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Fgreen,
                ),
              ),
            ],
          ),
          const Gap(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: ScreenSize.height * 0.07,
                width: ScreenSize.width * 0.2,
                decoration: BoxDecoration(
                  color: Fgrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  ingre05,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Fblack,
                  ),
                ),
              ),
              const Gap(5),
              Text(
                msr05,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Fgreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
