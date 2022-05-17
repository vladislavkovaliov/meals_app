import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  static String routeName = '/favorites';

  final List<Meal> favoriteMeals;

  const FavoritesScreen({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final isFavoriteEmpty = widget.favoriteMeals.isEmpty;
    final theme = Theme.of(context);

    if (isFavoriteEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }

    return Center(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.favoriteMeals[index].id,
            title: widget.favoriteMeals[index].title,
            imageUrl: widget.favoriteMeals[index].imageUrl,
            duration: widget.favoriteMeals[index].duration,
            complexity: widget.favoriteMeals[index].complexity,
            affordability: widget.favoriteMeals[index].affordability,
            categoryColor: theme.colorScheme.primary,
            ingredients: widget.favoriteMeals[index].ingredients,
            steps: widget.favoriteMeals[index].steps,
          );
        },
        itemCount: widget.favoriteMeals.length,
      ),
    );
  }
}
