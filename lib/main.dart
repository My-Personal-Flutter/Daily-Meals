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
                fontSize: 18,
                color: Color.fromRGBO(38, 45, 56, 1),
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
      home: const CategoriesScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Daily Meals'),
      ),
      body: const Center(
        child: Text('Navigation Time!'),
      ),
    );
  }
}
