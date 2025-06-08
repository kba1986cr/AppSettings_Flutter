import 'package:appsettings_flutter/preferences_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;
  String _language = "es";
  double _fontSize = 16;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  _loadPreferences() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = pref.getBool(PreferencesKeys.darkMode) ?? false;
      _language = pref.getString(PreferencesKeys.language) ?? "es";
      _fontSize = pref.getDouble(PreferencesKeys.fontSize) ?? 16;
    });
  }

  _savePreferences(String key, dynamic value) async {
    // Aquí puedes agregar la lógica para guardar las preferencias
    final pref = await SharedPreferences.getInstance();
    if (value is bool) {
      await pref.setBool(key, value);
    } else if (value is String) {
      await pref.setString(key, value);
    } else if (value is double) {
      await pref.setDouble(key, value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: _darkMode ? Colors.black : Colors.white,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        border: Border.all(color: Colors.blueGrey, width: 5),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey, width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightGreen,
              ),
              child: SwitchListTile(
                title: Text('Modo oscuro'),
                value: _darkMode,
                onChanged: (darkmode) {
                  setState(() => _darkMode = darkmode);
                  _savePreferences(PreferencesKeys.darkMode, darkmode);
                },
                secondary: const Icon(Icons.dark_mode, color: Colors.blueGrey),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey, width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightGreen,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  value: _language,
                  items: [
                    DropdownMenuItem(value: 'es', child: Text('Español')),
                    DropdownMenuItem(value: 'en', child: Text('Inglés')),
                    DropdownMenuItem(value: 'ch', child: Text('Chino')),
                  ],
                  onChanged: (language) {
                    // if (language != null) {
                    //   setState(() => _language = language);
                    // }
                    setState(() => _language = language!);
                    _savePreferences(PreferencesKeys.language, language);
                  },
                  decoration: InputDecoration(
                    labelText: 'Idioma',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.language, color: Colors.blueGrey),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey, width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightGreen,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Tamaño de la fuente ${_fontSize.toStringAsFixed(0)}",
                  style: TextStyle(fontSize: _fontSize),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey, width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightGreen,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slider(
                  min: 14,
                  max: 30,
                  value: _fontSize,
                  onChanged: (fontSize) {
                    setState(() => _fontSize = fontSize);
                    _savePreferences(PreferencesKeys.fontSize, fontSize);
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para guardar los ajustes
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Ajustes Guardados')));
              },
              child: Text('Guardar ajustes'),
            ),
          ],
        ),
      ),
    );
  }
}
