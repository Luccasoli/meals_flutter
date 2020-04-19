import 'package:flutter/material.dart';
import 'package:meals_flutter/utils/constants.dart';
import 'package:meals_flutter/screens/categories.dart';
import 'package:meals_flutter/screens/categories_meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: Constants.primaryFontFamily,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontSize: 20,
                fontFamily: Constants.titleFontFamily,
              ),
            ),
      ),
      routes: {
        Routes.HOME: (context) => CategoriesScreen(),
        Routes.CATEGORIES_MEALS: (context) => CategoriesMealsScreen(),
      },
    );
  }
}
