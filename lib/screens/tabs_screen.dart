import 'package:flutter/material.dart';
import 'package:meals_flutter/components/main_drawer.dart';
import 'package:meals_flutter/models/meal.dart';
import 'package:meals_flutter/screens/categories_screen.dart';
import 'package:meals_flutter/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, dynamic>> _screens;

  @override
  void initState() {
    super.initState();
    this._screens = [
      {'title': 'Categorias', 'screen': CategoriesScreen()},
      {'title': 'Favoritos', 'screen': FavoriteScreen(widget.favoriteMeals)},
    ];
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title']),
      ),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categorias'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favoritos'),
          ),
        ],
      ),
    );
  }
}
