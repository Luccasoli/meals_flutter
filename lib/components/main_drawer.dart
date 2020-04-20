import 'package:flutter/material.dart';
import 'package:meals_flutter/utils/constants.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label, Function onTap) {
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
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final navigator = Navigator.of(context);
    final modalRoute = ModalRoute.of(context);

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
            modalRoute.settings.name == Routes.HOME
                ? () => navigator.pop()
                : () => navigator.pushReplacementNamed(Routes.HOME),
          ),
          _createItem(
            Icons.settings,
            'Configurações',
            modalRoute.settings.name == Routes.SETTINGS
                ? () => navigator.pop()
                : () => navigator.pushReplacementNamed(Routes.SETTINGS),
          ),
        ],
      ),
    );
  }
}
