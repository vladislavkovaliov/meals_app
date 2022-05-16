import 'package:flutter/material.dart';
import 'package:meals_app/mocks_categories.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategotyMealsScreen extends StatefulWidget {
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
      displayedMeals = mockMeals
          .where(
            (x) => x.categories.contains(widget.categotyId),
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
    final appBar = AppBar(
      title: Text(widget.categoryTitle),
      backgroundColor: widget.categoryColor,
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
            categoryColor: widget.categoryColor,
            ingredients: displayedMeals[index].ingredients,
            steps: displayedMeals[index].steps,
            removeItem: removeItem,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
