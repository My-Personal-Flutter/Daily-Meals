import 'package:daily_meals/category_meals_screen.dart';
import 'package:daily_meals/catgories_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Meals',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
        ).copyWith(
          secondary: Colors.cyan,
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
      initialRoute: CategoriesScreen.routeName,
      routes: {
        CategoriesScreen.routeName: (ctx) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => const CategoryMealsScreen(),
      },
    );
  }
}
