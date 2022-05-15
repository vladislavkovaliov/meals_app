import 'package:flutter/material.dart';
import 'package:meals_app/mocks_categories.dart';

class CategotyMealsScreen extends StatelessWidget {
  final String categotyId;
  final String categoryTitle;
  final Color categoryColor;

  const CategotyMealsScreen({
    Key? key,
    required this.categotyId,
    required this.categoryTitle,
    required this.categoryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        categoryTitle,
      ),
      backgroundColor: categoryColor,
    );

    final meals =
        mockMeals.where((x) => x.categories.contains(categotyId)).toList();

    return Scaffold(
      appBar: appBar,
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(
            meals[index].title,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
