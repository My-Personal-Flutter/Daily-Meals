import 'package:daily_meals/screens/catgories_screen.dart';
import 'package:daily_meals/screens/favourites_screen.dart';
import 'package:daily_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = const [
    {
      "page": CategoriesScreen(),
      "title": "Categories",
    },
    {"page": FavouriteScreen(), "title": "Favourites"},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
        centerTitle: false,
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectedPageIndex]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Theme.of(context).colorScheme.onSecondary,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            //  backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            //  backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
