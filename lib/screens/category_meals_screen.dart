import 'package:daily_meals/data/dummy_data.dart';
import 'package:daily_meals/models/meal.dart';
import 'package:daily_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meal";

  const CategoryMealsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late String title;
  late List<Meal> categoryFilteredMeals;

  @override
  void initState() {
    // not iniitalized because the context object not founded here
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;

    title = routeArgs['title'] as String;
    final id = routeArgs['id'] as String;

    categoryFilteredMeals = DUMMY_MEALS.where((meal) {
      return meal.categories!.contains(id);
    }).toList();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryFilteredMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: false,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              meal: categoryFilteredMeals[index],
              removeItem: _removeMeal,
            );
          },
          itemCount: categoryFilteredMeals.length,
        ),
      ),
    );
  }
}
