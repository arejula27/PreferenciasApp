import 'package:flutter/material.dart';
import 'package:preferencesapp/src/pages/home.dart';
import 'package:preferencesapp/src/pages/settings.dart';
import 'package:preferencesapp/src/shared_prefs/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new Preferencias();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new Preferencias();
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: "home", //prefs.ultimaPagina,
      routes: {
        HomePage.ruta: (BuildContext context) => HomePage(),
        SettingsPage.ruta: (BuildContext context) => SettingsPage(),
      },
    );
  }
}
