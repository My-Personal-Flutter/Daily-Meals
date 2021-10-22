import 'package:daily_meals/models/meal.dart';
import 'package:daily_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  static const routeName = "/favourites";

  const FavouriteScreen(
      {Key? key, @required this.favouriteMeals, this.removeFavourite})
      : super(key: key);

  final List<Meal>? favouriteMeals;
  final Function? removeFavourite;

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  void _removeMeal(String mealId) {
    setState(() {
      widget.removeFavourite!(mealId);
    });
  }

  void _refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favouriteMeals!.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            "You have no favourites yet - start adding some!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    } else {
      setState(() {});
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: widget.favouriteMeals![index],
            removeItem: _removeMeal,
            refreshFavourite: _refresh,
          );
        },
        itemCount: widget.favouriteMeals!.length,
      );
    }
  }
}
