import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String? title;
  final Color? color;

  const CategoryItem({
    Key? key,
    @required this.title,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title!,
        style: Theme.of(context).textTheme.headline5,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color!.withOpacity(0.15),
            color!,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
