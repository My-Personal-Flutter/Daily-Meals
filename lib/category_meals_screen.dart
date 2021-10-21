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
    final color = routeArgs['color'] as Color;
    final id = routeArgs['id'] as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: false,
        backgroundColor: color,
        shadowColor: color,
        elevation: 6,
      ),
      body: const Center(
        child: Text("WQelcome to new Page"),
      ),
    );
  }
}
