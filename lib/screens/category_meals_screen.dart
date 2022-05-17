import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategotyMealsScreen extends StatefulWidget {
  static String routeName = '/category-meals';

  final List<Meal> meals;

  const CategotyMealsScreen({
    Key? key,
    required this.meals,
  }) : super(key: key);

  @override
  State<CategotyMealsScreen> createState() => _CategotyMealsScreenState();
}

class _CategotyMealsScreenState extends State<CategotyMealsScreen> {
  late List<Meal> displayedMeals;
  bool loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
      final categoryId = routeArgs['categoryId'] as String;

      displayedMeals = widget.meals
          .where(
            (x) => x.categories.contains(categoryId),
          )
          .toList();
      loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((x) => x.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final categoryTitle = routeArgs['categoryTitle'] as String;
    final categoryColor = routeArgs['categoryColor'] as Color;

    final appBar = AppBar(
      title: Text(categoryTitle),
      backgroundColor: categoryColor,
    );

    return Scaffold(
      appBar: appBar,
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            categoryColor: categoryColor,
            ingredients: displayedMeals[index].ingredients,
            steps: displayedMeals[index].steps,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
