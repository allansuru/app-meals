import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;

  const FavoriteScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text('Nenhuma refeição foi marcada como favorita'),
      );
    }
    return Center(
      child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(favoriteMeal[index]);
          },
          itemCount: favoriteMeal.length),
    );
  }
}
