import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';

import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class CategoriesMealScreen extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    final mealsByCategory =
        meals.where((meal) => meal.categories.contains(category.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: mealsByCategory.length,
            itemBuilder: (ctx, index) {
              return MealItem(mealsByCategory[index]);
            }),
      ),
    );
  }
}
