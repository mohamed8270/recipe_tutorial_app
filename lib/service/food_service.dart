// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_tutorial_app/models/category_model.dart';
import 'package:recipe_tutorial_app/models/food_models.dart';
import 'package:http/http.dart' as http;

class MealDB extends GetxController {
  var SearchMealController = TextEditingController();
  Future<void> searchMeals() async {
    final String query = SearchMealController.toString();
    if (query.isNotEmpty) {
      await FetchMealData(query);
    }
  }

  Future<List<MealModel>> FetchMealData(String query) async {
    http.Response mealres = await http.get(
      Uri.tryParse('http://themealdb.com/api/json/v1/1/search.php?s=$query')!,
    );

    Map<String, dynamic> mealjson = jsonDecode(mealres.body);
    List<dynamic> mealist = mealjson['meals'];
    List<MealModel> mealDBout =
        mealist.map((dynamic e) => MealModel.fromJson(e)).toList();
    return mealDBout;
  }

  Future<List<CategoryModel>> FetchMealCategoryData() async {
    http.Response mealcatres = await http.get(
      Uri.tryParse('http://themealdb.com/api/json/v1/1/categories.php')!,
    );

    Map<String, dynamic> mealcatjson = jsonDecode(mealcatres.body);
    List<dynamic> mealcatlist = mealcatjson['categories'];
    List<CategoryModel> mealcatDBout =
        mealcatlist.map((dynamic e) => CategoryModel.fromJson(e)).toList();
    return mealcatDBout;
  }
}
