import 'package:flutter/material.dart';

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

    return Scaffold(
      appBar: appBar,
      body: const SizedBox(
        child: Text(
          'Category Meals',
        ),
      ),
    );
  }
}
