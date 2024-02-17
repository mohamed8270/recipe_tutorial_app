// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_tutorial_app/constants/theme.dart';

class SearchBarField extends StatelessWidget {
  const SearchBarField({
    super.key,
    required this.ScreenSize,
    required this.Controller,
    required this.onSearch,
  });

  final Size ScreenSize;
  final TextEditingController Controller;
  final Function(String) onSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSize.height * 0.06,
      width: ScreenSize.width * 0.75,
      decoration: BoxDecoration(
        color: Fblack.withOpacity(0.02),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: TextField(
        cursorColor: Fgreen,
        cursorHeight: 20,
        cursorWidth: 2,
        controller: Controller,
        onSubmitted: onSearch,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Fblack,
        ),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.network(
              "https://www.svgrepo.com/show/497487/search-normal.svg",
              color: Fgreen,
            ),
          ),
          labelText: 'Search Recipe',
          labelStyle: GoogleFonts.poppins(
            fontSize: 12.5,
            fontWeight: FontWeight.w400,
            color: Fblack.withOpacity(0.5),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
