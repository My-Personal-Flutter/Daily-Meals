import 'package:daily_meals/data/dummy_data.dart';
import 'package:daily_meals/models/meal.dart';
import 'package:daily_meals/screens/category_meals_screen.dart';
import 'package:daily_meals/screens/catgories_screen.dart';
import 'package:daily_meals/screens/favourites_screen.dart';
import 'package:daily_meals/screens/filters_screen.dart';
import 'package:daily_meals/screens/meal_detail_screen.dart';
import 'package:daily_meals/screens/something_wrong_screen.dart';
import 'package:daily_meals/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((item) {
        if (_filters["gluten"]! && !item.isGlutenFree!) {
          return false;
        }
        if (_filters["lactose"]! && !item.isLactoseFree!) {
          return false;
        }
        if (_filters["vegan"]! && !item.isVegan!) {
          return false;
        }
        if (_filters["vegetarian"]! && !item.isVegetarian!) {
          return false;
        }
        return true;
      }).toList();
      print(_filters);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Meals',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
        ).copyWith(
          secondary: Colors.amber,
          onSecondary: Colors.white,
        ),
        canvasColor: Colors.blueGrey[50],
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: const TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(38, 45, 56, 0.8),
                fontWeight: FontWeight.bold,
              ),
              bodyText1: const TextStyle(
                color: Color.fromRGBO(38, 45, 56, 1),
                //color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(38, 45, 56, 1),
                //color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      initialRoute: "/",
      routes: {
        "/": (ctx) => const TabsScreen(),
        CategoriesScreen.routeName: (ctx) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        FavouriteScreen.routeName: (ctx) => const FavouriteScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              filters: _filters,
              saveFilters: _setFilters,
            ),
      },
      onGenerateRoute: (setting) {
        //
        //  For dynamic routes we use this method
        //
        // if(setting.name == "/somethin_from_server_url"){
        //   return ...;
        // }else if(setting.name == "/somethin_from_server_url"){
        //   return ...;
        // }
        // return MaterialPageRoute(
        //     builder: (ctx) => const SomethingWrongScreen());
      },
      onUnknownRoute: (setting) {
        //
        //  if no routes are found
        //  For error we use this like 404,500,200
        //
        return MaterialPageRoute(
            builder: (ctx) => const SomethingWrongScreen());
      },
    );
  }
}
