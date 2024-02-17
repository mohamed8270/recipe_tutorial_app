class MealModel {
  final String? mealname;
  final String? mealdrink;
  final String? category;
  final String? area;
  final String? introduction;
  final String? mealthumb;
  final String? tags;
  final String? youtube;
  final String? ingredient01;
  final String? ingredient02;
  final String? ingredient03;
  final String? ingredient04;
  final String? ingredient05;
  final String? ingredient06;
  final String? ingredient07;
  final String? ingredient08;
  final String? ingredient09;
  final String? ingredient10;
  final String? ingredient11;
  final String? ingredient12;
  final String? ingredient13;
  final String? ingredient14;
  final String? ingredient15;
  final String? ingredient16;
  final String? ingredient17;
  final String? ingredient18;
  final String? ingredient19;
  final String? ingredient20;
  final String? ingredientmsr01;
  final String? ingredientmsr02;
  final String? ingredientmsr03;
  final String? ingredientmsr04;
  final String? ingredientmsr05;
  final String? ingredientmsr06;
  final String? ingredientmsr07;
  final String? ingredientmsr08;
  final String? ingredientmsr09;
  final String? ingredientmsr10;
  final String? ingredientmsr11;
  final String? ingredientmsr12;
  final String? ingredientmsr13;
  final String? ingredientmsr14;
  final String? ingredientmsr15;
  final String? ingredientmsr16;
  final String? ingredientmsr17;
  final String? ingredientmsr18;
  final String? ingredientmsr19;
  final String? ingredientmsr20;
  final String? source;
  final String? imgsource;
  final String? creativecommon;
  final String? datemodified;

  MealModel(
      {this.mealname,
      this.mealdrink,
      this.category,
      this.area,
      this.introduction,
      this.mealthumb,
      this.tags,
      this.youtube,
      this.ingredient01,
      this.ingredient02,
      this.ingredient03,
      this.ingredient04,
      this.ingredient05,
      this.ingredient06,
      this.ingredient07,
      this.ingredient08,
      this.ingredient09,
      this.ingredient10,
      this.ingredient11,
      this.ingredient12,
      this.ingredient13,
      this.ingredient14,
      this.ingredient15,
      this.ingredient16,
      this.ingredient17,
      this.ingredient18,
      this.ingredient19,
      this.ingredient20,
      this.ingredientmsr01,
      this.ingredientmsr02,
      this.ingredientmsr03,
      this.ingredientmsr04,
      this.ingredientmsr05,
      this.ingredientmsr06,
      this.ingredientmsr07,
      this.ingredientmsr08,
      this.ingredientmsr09,
      this.ingredientmsr10,
      this.ingredientmsr11,
      this.ingredientmsr12,
      this.ingredientmsr13,
      this.ingredientmsr14,
      this.ingredientmsr15,
      this.ingredientmsr16,
      this.ingredientmsr17,
      this.ingredientmsr18,
      this.ingredientmsr19,
      this.ingredientmsr20,
      this.source,
      this.imgsource,
      this.creativecommon,
      this.datemodified});

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      mealname: (json['strMeal'] as String?)?.toString(),
      mealdrink: (json['strDrinkAlternate'] as String?)?.toString(),
      category: (json['strCategory'] as String?)?.toString(),
      area: (json['strArea'] as String?)?.toString(),
      introduction: (json['strInstructions'] as String?)?.toString(),
      mealthumb: (json['strMealThumb'] as String?)?.toString(),
      tags: (json['strTags'] as String?)?.toString(),
      youtube: (json['strYoutube'] as String?)?.toString(),
      ingredient01: (json['strIngredient1'] as String?)?.toString(),
      ingredient02: (json['strIngredient2'] as String?)?.toString(),
      ingredient03: (json['strIngredient3'] as String?)?.toString(),
      ingredient04: (json['strIngredient4'] as String?)?.toString(),
      ingredient05: (json['strIngredient5'] as String?)?.toString(),
      ingredient06: (json['strIngredient6'] as String?)?.toString(),
      ingredient07: (json['strIngredient7'] as String?)?.toString(),
      ingredient08: (json['strIngredient8'] as String?)?.toString(),
      ingredient09: (json['strIngredient9'] as String?)?.toString(),
      ingredient10: (json['strIngredient10'] as String?)?.toString(),
      ingredient11: (json['strIngredient11'] as String?)?.toString(),
      ingredient12: (json['strIngredient12'] as String?)?.toString(),
      ingredient13: (json['strIngredient13'] as String?)?.toString(),
      ingredient14: (json['strIngredient14'] as String?)?.toString(),
      ingredient15: (json['strIngredient15'] as String?)?.toString(),
      ingredient16: (json['strIngredient16'] as String?)?.toString(),
      ingredient17: (json['strIngredient17'] as String?)?.toString(),
      ingredient18: (json['strIngredient18'] as String?)?.toString(),
      ingredient19: (json['strIngredient19'] as String?)?.toString(),
      ingredient20: (json['strIngredient20'] as String?)?.toString(),
      ingredientmsr01: (json['strMeasure1'] as String?)?.toString(),
      ingredientmsr02: (json['strMeasure2'] as String?)?.toString(),
      ingredientmsr03: (json['strMeasure3'] as String?)?.toString(),
      ingredientmsr04: (json['strMeasure4'] as String?)?.toString(),
      ingredientmsr05: (json['strMeasure5'] as String?)?.toString(),
      ingredientmsr06: (json['strMeasure6'] as String?)?.toString(),
      ingredientmsr07: (json['strMeasure7'] as String?)?.toString(),
      ingredientmsr08: (json['strMeasure8'] as String?)?.toString(),
      ingredientmsr09: (json['strMeasure9'] as String?)?.toString(),
      ingredientmsr10: (json['strMeasure10'] as String?)?.toString(),
      ingredientmsr11: (json['strMeasure11'] as String?)?.toString(),
      ingredientmsr12: (json['strMeasure12'] as String?)?.toString(),
      ingredientmsr13: (json['strMeasure13'] as String?)?.toString(),
      ingredientmsr14: (json['strMeasure14'] as String?)?.toString(),
      ingredientmsr15: (json['strMeasure15'] as String?)?.toString(),
      ingredientmsr16: (json['strMeasure16'] as String?)?.toString(),
      ingredientmsr17: (json['strMeasure17'] as String?)?.toString(),
      ingredientmsr18: (json['strMeasure18'] as String?)?.toString(),
      ingredientmsr19: (json['strMeasure19'] as String?)?.toString(),
      ingredientmsr20: (json['strMeasure20'] as String?)?.toString(),
      source: (json['strSource'] as String?)?.toString(),
      imgsource: (json['strImageSource'] as String?)?.toString(),
      creativecommon:
          (json['strCreativeCommonsConfirmed'] as String?)?.toString(),
      datemodified: (json['dateModified'] as String?)?.toString(),
    );
  }
}
