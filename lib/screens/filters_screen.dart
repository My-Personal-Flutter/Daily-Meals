import 'package:daily_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = "/filters";

  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        centerTitle: false,
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text("Hello Detective"),
      ),
    );
  }
}
