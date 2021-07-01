import 'package:flutter/material.dart';
import 'package:preferencesapp/src/pages/home.dart';
import 'package:preferencesapp/src/pages/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.ruta,
      routes: {
        HomePage.ruta: (BuildContext context) => HomePage(),
        SettingsPage.ruta: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
