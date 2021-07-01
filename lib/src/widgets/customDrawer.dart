import 'package:flutter/material.dart';
import 'package:preferencesapp/src/pages/home.dart';
import 'package:preferencesapp/src/pages/settings.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(
              child: CircleAvatar(
                radius: 45.0,
                backgroundImage: NetworkImage(
                    "http://www.centauro.com.mx/wp-content/uploads/Indicadores-de-que-eres-una-persona-feliz.jpg"),
              ),
              //maxRadius: 3.0,
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/menu-img.jpg"))),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            title: Text("Home"),
            onTap: () => Navigator.pushReplacementNamed(context, HomePage.ruta),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.blue,
            ),
            title: Text("Social"),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            title: Text("Settings"),
            onTap: () {
              Navigator.pushReplacementNamed(context, SettingsPage.ruta);
            },
          ),
        ],
      ),
    );
  }
}
