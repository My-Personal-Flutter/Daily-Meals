import 'package:daily_meals/screens/catgories_screen.dart';
import 'package:daily_meals/screens/favourites_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Daily meals"),
          centerTitle: false,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(
                  Icons.favorite_outline,
                ),
                text: 'Favourites',
              )
            ],
          ),
        ),
        body: const SafeArea(
          child: TabBarView(children: [
            CategoriesScreen(),
            FavouriteScreen(),
          ]),
        ),
      ),
    );
  }
}
