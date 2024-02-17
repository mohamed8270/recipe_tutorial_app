class CategoryModel {
  final String categoryname;
  final String categorythumb;
  final String categorydescription;

  CategoryModel({
    required this.categoryname,
    required this.categorythumb,
    required this.categorydescription,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryname: json['strCategory'],
      categorythumb: json['strCategoryThumb'],
      categorydescription: json['strCategoryDescription'],
    );
  }
}
