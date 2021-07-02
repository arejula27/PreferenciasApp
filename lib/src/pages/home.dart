import 'package:flutter/material.dart';
import 'package:preferencesapp/src/shared_prefs/preferencias_usuario.dart';
import 'package:preferencesapp/src/widgets/customDrawer.dart';

class HomePage extends StatelessWidget {
  static final String ruta = "home";

  @override
  Widget build(BuildContext context) {
    final prefs = new Preferencias();
    prefs.ultimaPagina = ruta;
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Colo secundario: ${prefs.colorSecundario}"),
            Divider(),
            Text("genero: ${prefs.genero}"),
            Divider(),
            Text("Nombre usuario: ${prefs.nombreUsuario}")
          ]),
    );
  }
}
