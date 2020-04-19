import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_flutter/utils/constants.dart';
import 'package:meals_flutter/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      Routes.CATEGORIES_MEALS,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(15);
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: borderRadius,
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.title,
        ),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
