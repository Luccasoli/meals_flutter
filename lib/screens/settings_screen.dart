import 'package:flutter/material.dart';
import 'package:meals_flutter/components/main_drawer.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Center(
        child: Text('Configurações'),
      ),
    );
  }
}
