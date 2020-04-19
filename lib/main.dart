import 'package:flutter/material.dart';
import 'package:meals_flutter/config/constants.dart';
import 'package:meals_flutter/screens/categories.dart';

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
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontSize: 20,
                fontFamily: Constants.titleFontFamily,
              ),
            ),
      ),
      home: CategoriesScreen(),
    );
  }
}
