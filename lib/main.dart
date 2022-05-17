import 'package:flutter/material.dart';
import 'package:meals_app/mocks_categories.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> avaliableMeals = mockMeals;
  List<Meal> favoriteMeals = [];

  void setFilters(Map<String, bool> filtersData) {
    setState(() {
      filters = filtersData;
      avaliableMeals = mockMeals.where((x) {
        if (filters['gluten'] == true && !x.isGlutenFree) {
          return false;
        }

        if (filters['lactose'] == true && !x.isLactoseFree) {
          return false;
        }

        if (filters['vegan'] == true && !x.isVegan) {
          return false;
        }

        if (filters['vegetarian'] == true && !x.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void toggleFavoriteMeal(String mealId) {
    final alreadyExistIndex = favoriteMeals.indexWhere((x) => x.id == mealId);

    if (alreadyExistIndex >= 0) {
      setState(() {
        favoriteMeals.removeWhere((x) => x.id == mealId);
      });
    } else {
      final meal = avaliableMeals.firstWhere((x) => x.id == mealId);
      setState(() {
        favoriteMeals.add(meal);
      });
    }
  }

  bool isFavoriteMeal(String id) {
    return favoriteMeals.any((x) => x.id == id);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData();

    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          colorScheme: themeData.colorScheme.copyWith(
            primary: Colors.pink,
            secondary: Colors.amberAccent,
          ),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed",
                ),
              )),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(
              favoriteMeals: favoriteMeals,
            ),
        CategotyMealsScreen.routeName: (ctx) => CategotyMealsScreen(
              meals: avaliableMeals,
            ),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(
              toggleFavoriteMeal: toggleFavoriteMeal,
              isFavoriteMeal: isFavoriteMeal,
            ),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              filters: filters,
              saveFilters: setFilters,
            ),
      },
    );
  }
}
