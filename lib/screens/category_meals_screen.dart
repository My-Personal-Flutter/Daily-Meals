import 'package:daily_meals/data/dummy_data.dart';
import 'package:daily_meals/models/meal.dart';
import 'package:daily_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meal";

  const CategoryMealsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;

    final title = routeArgs['title'] as String;
    final id = routeArgs['id'] as String;

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories!.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: false,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              meal: categoryMeals[index],
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
