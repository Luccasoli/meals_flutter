import 'package:flutter/material.dart';
import 'package:meals_flutter/data/dummy_data.dart';
import 'package:meals_flutter/models/meal.dart';
import 'package:meals_flutter/models/settings.dart';
import 'package:meals_flutter/screens/meal_details_screen.dart';
import 'package:meals_flutter/screens/settings_screen.dart';
import 'package:meals_flutter/screens/tabs_screen.dart';
import 'package:meals_flutter/utils/constants.dart';
import 'package:meals_flutter/screens/categories_screen.dart';
import 'package:meals_flutter/screens/categories_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterVegetarian &&
            !filterVegan &&
            !filterLactose &&
            !filterGluten;
      }).toList();
    });
  }

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
        Routes.HOME: (context) => TabsScreen(),
        Routes.CATEGORIES_MEALS: (context) =>
            CategoriesMealsScreen(_availableMeals),
        Routes.MEAL_DETAILS: (context) => MealDetailsScreen(),
        Routes.SETTINGS: (context) => SettingsScreen(_filterMeals, settings),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => CategoriesScreen(),
        );
      },
    );
  }
}
