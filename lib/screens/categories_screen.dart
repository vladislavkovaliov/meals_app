import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/mocks_categories.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  GridView buildBody() {
    return GridView(
      padding: const EdgeInsets.all(12.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: mockCategories
          .map((c) => CategoryItem(
                key: ValueKey(c.id),
                id: c.id,
                title: c.title,
                color: c.color,
              ))
          .toList(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('DeliMeals'),
    );
  }
}
