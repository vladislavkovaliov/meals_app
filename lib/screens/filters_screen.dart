import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = '/filters';

  final Function saveFilters;

  final Map<String, bool> filters;

  const FiltersScreen({
    Key? key,
    required this.filters,
    required this.saveFilters,
  }) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  @override
  void initState() {
    glutenFree = widget.filters['gluten'] as bool;
    vegetarian = widget.filters['vegetarian'] as bool;
    vegan = widget.filters['vegan'] as bool;
    lactoseFree = widget.filters['lactose'] as bool;

    super.initState();
  }

  void handleChangeGluten(bool value) {
    setState(() {
      glutenFree = value;
    });
  }

  void handleChangeVegetarian(bool value) {
    setState(() {
      vegetarian = value;
    });
  }

  void handleChangeVegan(bool value) {
    setState(() {
      vegan = value;
    });
  }

  void handleChangeLactose(bool value) {
    setState(() {
      lactoseFree = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final filterData = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan': vegan,
                'vegetarian': vegetarian,
              };
              widget.saveFilters(filterData);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: theme.textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitch('Gluten-free', 'Only include gluten-free meals',
                    glutenFree, handleChangeGluten),
                buildSwitch('Vegetarian', 'Only include vegetarian meals',
                    vegetarian, handleChangeVegetarian),
                buildSwitch('Vegan', 'Only include vegan meals', vegan,
                    handleChangeVegan),
                buildSwitch('Lactose-free', 'Only include lactose-free meals',
                    lactoseFree, handleChangeLactose),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitch(
      String title, String subtitle, bool value, Function fnChange) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (x) => fnChange(x),
    );
  }
}
