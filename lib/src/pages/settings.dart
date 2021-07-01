import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preferencesapp/src/widgets/customDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String COLORKEY = "color";
const String GENDERKEY = "gender";

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

  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _colorSecundario = prefs.getBool(COLORKEY) ?? true;
    _gender = prefs.getInt(GENDERKEY) ?? 1;
    setState(() {});

    print(
        "AL iniciar " + _colorSecundario.toString() + " " + _gender.toString());
  }

  _setColor(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(COLORKEY, value);
    _colorSecundario = value;
    setState(() {});
    print("genero: " + value.toString());
  }

  _setSelectedGender(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _gender = value;
    prefs.setInt(GENDERKEY, value);
    setState(() {});
    print("genero: " + value.toString());
  }

 

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: _name);
    _loadData();
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
            onEditingComplete: ,
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
