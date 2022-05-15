import 'package:flutter/material.dart';

class CategotyMealsScreen extends StatelessWidget {
  const CategotyMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const Text(
        'The Recipes',
      ),
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
