import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preferencesapp/widgets/customDrawer.dart';

class SettingsPage extends StatefulWidget {
  static final String ruta = "settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = true;
  int? _gender = 1;
  String _name = "";
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: _name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.all(0.5),
          child: Text(
            "Ajustes",
            style: TextStyle(fontSize: 32),
          ),
        ),
        SwitchListTile(
            title: Text("Color secudario"),
            value: _colorSecundario,
            onChanged: (value) {
              _colorSecundario = value;
              print("cambiamos a " + value.toString());
              setState(() {});
            }),
        Divider(),
        RadioListTile(
          value: 1,
          title: Text("Chico"),
          groupValue: _gender,
          onChanged: (int? value) {
            _gender = value;
            setState(() {});
            print("genero: " + value.toString());
          },
        ),
        RadioListTile(
          value: 2,
          title: Text("Chica"),
          groupValue: _gender,
          onChanged: (int? value) {
            _gender = value;

            setState(() {});
            print("genero: " + value.toString());
          },
        ),
        Divider(),
        Text("Nombre usuario"),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
              labelText: "Nombre",
              helperText: "¿Quién eres",
            ),
          ),
        )
      ]),
    );
  }
}
