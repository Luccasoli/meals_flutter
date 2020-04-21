import 'package:flutter/material.dart';
import 'package:meals_flutter/components/main_drawer.dart';
import 'package:meals_flutter/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;

  const SettingsScreen(this.onSettingsChanged, this.settings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings;

  @override
  void initState() {
    super.initState();

    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Sem Glúten',
                  'Só exibe refeições sem glúten',
                  settings.isGlutenFree,
                  (value) {
                    setState(() {
                      settings.isGlutenFree = value;
                    });
                  },
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose',
                  settings.isLactoseFree,
                  (value) {
                    setState(() {
                      settings.isLactoseFree = value;
                    });
                  },
                ),
                _createSwitch(
                  'Veganas',
                  'Só exibe refeições veganas',
                  settings.isVegan,
                  (value) {
                    setState(() {
                      settings.isVegan = value;
                    });
                  },
                ),
                _createSwitch(
                  'Vegetarianas',
                  'Só exibe refeições vegetarianas',
                  settings.isVegetarian,
                  (value) {
                    setState(() {
                      settings.isVegetarian = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
