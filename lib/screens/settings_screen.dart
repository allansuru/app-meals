import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;
  const SettingsScreen(this.onSettingsChanged, this.settings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile(
      activeColor: Colors.green,
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(widget.settings);
      },
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Configurações'),
        ),
        // drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _createSwitch(
                    'Sem Glúten',
                    'Só exibe refeições sem glúten!',
                    widget.settings.isGlutenFree,
                    (value) =>
                        setState(() => widget.settings.isGlutenFree = value)),
                _createSwitch(
                    'Sem Lactose',
                    'Só exibe refeições sem lactose!',
                    widget.settings.isLactoseFree,
                    (value) =>
                        setState(() => widget.settings.isLactoseFree = value)),
                _createSwitch(
                    'Vegana',
                    'Só exibe comidas vegana!',
                    widget.settings.isVegan,
                    (value) => setState(() => widget.settings.isVegan = value)),
                _createSwitch(
                    'Vegetariana',
                    'Só exibe comidas vegatariana!',
                    widget.settings.isVegetarian,
                    (value) =>
                        setState(() => widget.settings.isVegetarian = value)),
              ],
            )),
          ],
        ));
  }
}
