import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static String routeName = '/meal-details';

  final Function toggleFavoriteMeal;
  final Function isFavoriteMeal;

  const MealDetailsScreen({
    Key? key,
    required this.toggleFavoriteMeal,
    required this.isFavoriteMeal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final ingredients = routeArgs['ingredients'] as List<String>;
    final steps = routeArgs['steps'] as List<String>;

    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildImage(context, 15),
            Column(
              children: [
                ...buildIngredients(context, ingredients),
                ...buildSteps(context, steps),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: buildFloatingButton(context),
    );
  }

  FloatingActionButton buildFloatingButton(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final id = routeArgs['id'] as String;

    return FloatingActionButton(
      child: Icon(
        isFavoriteMeal(id) ? Icons.delete : Icons.star,
      ),
      onPressed: () => toggleFavoriteMeal(id),
    );
  }

  List<Widget> buildSteps(BuildContext context, List<String> steps) {
    final theme = Theme.of(context);
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final categoryColor = routeArgs['categoryColor'] as Color;

    return [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'Steps',
          style: theme.textTheme.headline6,
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      '# ${index + 1}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: categoryColor,
                  ),
                  title: Text(steps[index]),
                ),
                const Divider(),
              ],
            );
          },
          itemCount: steps.length,
        ),
      )
    ];
  }

  List<Widget> buildIngredients(BuildContext context, List<String> items) {
    final theme = Theme.of(context);

    return [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'Ingredients',
          style: theme.textTheme.headline6,
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              color: theme.colorScheme.secondary,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Text(items[index]),
              ),
            );
          },
          itemCount: items.length,
        ),
      ),
    ];
  }

  AppBar buildAppBar(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final title = routeArgs['title'] as String;
    final categoryColor = routeArgs['categoryColor'] as Color;

    return AppBar(
      title: Text(title),
      backgroundColor: categoryColor,
    );
  }

  SizedBox buildImage(BuildContext context, double border) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final imageUrl = routeArgs['imageUrl'] as String;

    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Image.network(
        imageUrl,
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
