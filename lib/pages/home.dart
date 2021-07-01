import 'package:flutter/material.dart';
import 'package:preferencesapp/widgets/customDrawer.dart';

class HomePage extends StatelessWidget {
  static final String ruta = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Colo secundario"),
            Divider(),
            Text("genero:"),
            Divider(),
            Text("Nombre usuario")
          ]),
    );
  }
}
