import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;

  final int duration;

  final List<String> ingredients;
  final List<String> steps;

  final Color categoryColor;
  final Complexity complexity;
  final Affordability affordability;

  final Function removeItem;

  const MealItem({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.categoryColor,
    required this.ingredients,
    required this.steps,
    required this.removeItem,
    Key? key,
  }) : super(key: key);

  void handleTap(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
        'categoryColor': categoryColor,
        'imageUrl': imageUrl,
        'ingredients': ingredients,
        'steps': steps,
      },
    ).then((mealId) {
      if (mealId != null) {
        removeItem(mealId);
      }
    });
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return "Simple";
      case Complexity.challenging:
        return "Challenging";
      case Complexity.hard:
        return "Hard";
      default:
        return 'N/A';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.pricey:
        return "Pricey";
      case Affordability.affordable:
        return "Affordable";
      case Affordability.luxurious:
        return "Luxurious";
      default:
        return 'N/A';
    }
  }

  @override
  Widget build(BuildContext context) {
    const double border = 15;

    return InkWell(
      onTap: () => handleTap(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(border),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                buildImage(border),
                buildTitle(),
              ],
            ),
            buildInfo(),
          ],
        ),
      ),
    );
  }

  Padding buildInfo() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildDuration(),
          buildComplexity(),
          buildAffordability(),
        ],
      ),
    );
  }

  Row buildAffordability() {
    return Row(
      children: [
        const Icon(Icons.attach_money),
        const SizedBox(width: 6),
        Text(affordabilityText),
      ],
    );
  }

  Row buildComplexity() {
    return Row(
      children: [
        const Icon(Icons.work),
        const SizedBox(width: 6),
        Text(complexityText),
      ],
    );
  }

  Row buildDuration() {
    return Row(
      children: [
        const Icon(Icons.schedule),
        const SizedBox(width: 6),
        Text('$duration min'),
      ],
    );
  }

  Positioned buildTitle() {
    return Positioned(
      bottom: 20,
      right: 10,
      child: Container(
        width: 270,
        color: Colors.black54,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 20,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            color: Colors.white,
          ),
          softWrap: true,
          overflow: TextOverflow.fade,
        ),
      ),
    );
  }

  ClipRRect buildImage(double border) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(border),
        topRight: Radius.circular(border),
      ),
      child: Image.network(
        imageUrl,
        height: 250,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
