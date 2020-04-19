import 'package:flutter/material.dart';
import 'package:meals_flutter/data/dummy_data.dart';
import 'package:meals_flutter/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Category category = ModalRoute.of(context).settings.arguments;
    final categoryMeals = DUMMY_MEALS
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
