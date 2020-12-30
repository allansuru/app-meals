import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Lista de Categorias', 'screen': CategoriesScreen()},
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals)
      },
    ];
  }

  _selectedScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedScreenIndex,
          onTap: _selectedScreen,
          type: BottomNavigationBarType.shifting,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.category,
                ),
                label: 'Categorias'),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(
                  Icons.favorite,
                ),
                label: 'Favoritos')
          ],
        ),
        appBar: AppBar(title: Text(_screens[_selectedScreenIndex]['title'])),
        body: _screens[_selectedScreenIndex]['screen'],
        drawer: MainDrawer());
  }
}
