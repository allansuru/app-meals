import 'package:flutter/material.dart';

class MealItemFooter extends StatelessWidget {
  final String title;
  final IconData icon;

  const MealItemFooter({@required this.title, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 6,
        ),
        Text(title)
      ],
    );
  }
}
