import 'package:daily_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  const FiltersScreen(
      {Key? key, @required this.filters, @required this.saveFilters})
      : super(key: key);

  final Map<String, bool>? filters;
  final Function? saveFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late bool _glutenFree;
  late bool _vegetarian;
  late bool _vegan;
  late bool _lactoseFree;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.filters!['gluten']!;
    _lactoseFree = widget.filters!['lactose']!;
    _vegan = widget.filters!['vegan']!;
    _vegetarian = widget.filters!['vegetarian'] as bool;
  }

  Widget _buildSwitchListTile(
    String title,
    String subtitle,
    bool currentValue,
    Function updateValue,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        elevation: 3,
        child: SwitchListTile(
          activeColor: Theme.of(context).colorScheme.secondary,
          value: currentValue,
          title: Text(title),
          subtitle: Text(subtitle),
          onChanged: (newValue) => updateValue(newValue),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                widget.saveFilters!({
                  "gluten": _glutenFree,
                  "lactose": _lactoseFree,
                  "vegan": _vegan,
                  "vegetarian": _vegetarian,
                });
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 24, bottom: 20),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                "Gluten-free",
                "Only include gluten-free meals.",
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                "Lactose-free",
                "Only include lcatose-free meals.",
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                "Vegetarian",
                "Only include vegetarian meals.",
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                "Vegan",
                "Only include vegan meals.",
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
