import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  static String routeName = '/favorites';

  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorites'),
    );
  }
}
