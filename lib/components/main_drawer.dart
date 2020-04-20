import 'package:flutter/material.dart';
import 'package:meals_flutter/utils/constants.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: Constants.titleFontFamily,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: statusBarHeight,
              horizontal: 20,
            ),
            color: theme.accentColor,
            alignment: Alignment.bottomRight,
            child: Text(
              'Vamos Cozinhar',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: theme.primaryColor,
              ),
            ),
          ),
          _createItem(
            Icons.restaurant,
            'Refeições',
          ),
          _createItem(
            Icons.settings,
            'Configurações',
          ),
        ],
      ),
    );
  }
}
