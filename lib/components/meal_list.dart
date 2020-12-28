import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealList extends StatelessWidget {
  final List<Meal> meal;

  const MealList(this.meal);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: meal.length,
          itemBuilder: (ctx, index) {
            return Text(meal[index].title);
          }),
    );
  }
}
