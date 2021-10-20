import 'package:daily_meals/category_item.dart';
import 'package:daily_meals/data/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Daily Meals"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        children: DUMMY_CATEGORIES.map((item) {
          return CategoryItem(
            title: item.title,
            color: item.color,
          );
        }).toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
      ),
    );
  }
}
