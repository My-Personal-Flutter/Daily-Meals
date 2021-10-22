import 'package:daily_meals/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";

  const MealDetailScreen({Key? key}) : super(key: key);

  Widget _buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _buildContainerWithListitem(Widget child) {
    return Container(
      height: 250,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueGrey,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(4),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs.title as String),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 300,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Image.network(
                    routeArgs.imageUrl as String,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _buildSectionTitle(
                  context, "Ingredients (${routeArgs.ingredients!.length})"),
              _buildContainerWithListitem(
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: Text(
                        "( ${index + 1} ) :  ${routeArgs.ingredients![index]}",
                        style: const TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  itemCount: routeArgs.ingredients!.length,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              _buildSectionTitle(context, "Steps (${routeArgs.steps!.length})"),
              _buildContainerWithListitem(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            "# ${index + 1}",
                          ),
                        ),
                        title: Text(routeArgs.steps![index]),
                      ),
                      const Divider(
                        thickness: 0.8,
                      )
                    ],
                  ),
                  itemCount: routeArgs.steps!.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
