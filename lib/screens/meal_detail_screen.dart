import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  final Color categoryColor;

  final List<String> ingredients;
  final List<String> steps;

  const MealDetailsScreen({
    Key? key,
    required this.id,
    required this.title,
    required this.categoryColor,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
  }) : super(key: key);

  void handlePressed(BuildContext context) {
    Navigator.of(context).pop(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildImage(15),
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
    return FloatingActionButton(
      child: const Icon(
        Icons.delete,
      ),
      onPressed: () => handlePressed(context),
    );
  }

  List<Widget> buildSteps(BuildContext context, List<String> steps) {
    final theme = Theme.of(context);

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

  AppBar buildAppBar() {
    return AppBar(
      title: Text(title),
      backgroundColor: categoryColor,
    );
  }

  SizedBox buildImage(double border) {
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
