import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  List<Meal> _favoriteMeals = [];

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

  void _toggleFavorite(Meal meal) {
    var message = '';
    setState(() {
      if (_favoriteMeals.contains(meal)) {
        _favoriteMeals.remove(meal);
        message = 'Refeição removida dos favoritos!';
      } else {
        _favoriteMeals.add(meal);
        message = 'Refeição adicionada dos favoritos!';
      }
      GetBar(
        message: message,
        duration: Duration(milliseconds: 2000),
        isDismissible: true,
      ).show();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: Get.key,
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
          Routes.HOME: (context) => TabsScreen(this._favoriteMeals),
          Routes.CATEGORIES_MEALS: (context) =>
              CategoriesMealsScreen(_availableMeals),
          Routes.MEAL_DETAILS: (context) =>
              MealDetailsScreen(this._toggleFavorite),
          Routes.SETTINGS: (context) => SettingsScreen(_filterMeals, settings),
        });
  }
}
