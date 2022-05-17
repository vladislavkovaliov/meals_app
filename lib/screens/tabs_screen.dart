import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  static String routeName = '/';

  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> pages = [
    {
      'page': const CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': const FavoritesScreen(),
      'title': 'Favorites',
    },
  ];

  int selectedPageIndex = 0;

  void handleTap(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final items = [
      BottomNavigationBarItem(
        backgroundColor: theme.colorScheme.primary,
        icon: const Icon(Icons.category),
        label: "Categories",
      ),
      BottomNavigationBarItem(
        backgroundColor: theme.colorScheme.primary,
        icon: const Icon(Icons.star),
        label: "Favorites",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]['title'].toString()),
      ),
      body: pages[selectedPageIndex]['page'] as Widget,
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: theme.colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: theme.colorScheme.secondary,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        onTap: handleTap,
        items: items,
      ),
    );
  }
}
