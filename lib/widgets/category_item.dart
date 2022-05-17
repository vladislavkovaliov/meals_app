import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;

  final Color color;

  const CategoryItem({
    Key? key,
    required this.id,
    required this.title,
    required this.color,
  }) : super(key: key);

  void handleTapCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategotyMealsScreen.routeName,
      arguments: {
        'categoryId': id,
        'categoryTitle': title,
        'categoryColor': color,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final radius = BorderRadius.circular(20.0);

    return InkWell(
      onTap: () => handleTapCategory(context),
      splashColor: theme.primaryColor,
      borderRadius: radius,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          title,
          style: theme.textTheme.headline6,
        ),
        decoration: BoxDecoration(
          borderRadius: radius,
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.8),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
