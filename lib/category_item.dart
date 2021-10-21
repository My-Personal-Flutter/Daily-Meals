import 'package:flutter/material.dart';

import 'category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String? id;
  final String? title;
  final Color? color;

  const CategoryItem({
    Key? key,
    @required this.id,
    @required this.title,
    @required this.color,
  }) : super(key: key);

  void _selectCategory(BuildContext buildContext) {
    Navigator.of(buildContext).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: <String, Object?>{
        "id": id,
        "title": title,
        "color": color,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      // child: Card(
      //   elevation: 3,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      child: Container(
        child: Text(
          title!,
          style: Theme.of(context).textTheme.headline5,
        ),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color!.withOpacity(0.2),
              color!.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      // ),
    );
  }
}
