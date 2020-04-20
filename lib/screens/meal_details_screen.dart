import 'package:flutter/material.dart';
import 'package:meals_flutter/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.4,
            ),
            child: Container(
              width: double.infinity,
              child: Hero(
                tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              'Ingredientes',
              style: theme.textTheme.title,
            ),
          ),
          Expanded(
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Text(meal.ingredients[index]),
                    ),
                    color: theme.accentColor,
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
