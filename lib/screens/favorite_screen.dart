import 'package:flutter/material.dart';
import 'package:meals_flutter/components/meal_item.dart';
import 'package:meals_flutter/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('Nenhuma Refeição foi marcada como favorita!'),
      );
    }
    return ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (context, index) {
        return MealItem(favoriteMeals[index]);
      },
    );
  }
}
