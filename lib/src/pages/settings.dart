import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preferencesapp/src/shared_prefs/preferencias_usuario.dart';
import 'package:preferencesapp/src/widgets/customDrawer.dart';

class SettingsPage extends StatefulWidget {
  static final String ruta = "settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final prefs = new Preferencias();
  late bool _colorSecundario;
  late int _gender;
  late String _name;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: _name);
    _gender = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _name = "";
  }

  _setColor(bool value) async {
    prefs.initPrefs();
    prefs.colorSecundario = value;
    _colorSecundario = value;
    setState(() {});
    print("genero: " + value.toString());
  }

  _setSelectedGender(int value) async {
    _gender = value;
    prefs.genero = value;
    setState(() {});
    print("genero: " + value.toString());
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
              _setColor(value);
            }),
        Divider(),
        RadioListTile(
          value: 1,
          title: Text("Chico"),
          groupValue: _gender,
          onChanged: (int? value) {
            _setSelectedGender(value!);
          },
        ),
        RadioListTile(
          value: 2,
          title: Text("Chica"),
          groupValue: _gender,
          onChanged: (int? value) {
            _setSelectedGender(value!);
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
