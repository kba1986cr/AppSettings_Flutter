import 'package:flutter/material.dart';

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
                title: const Text('Modo oscuro'),
                value: _darkMode,
                onChanged: (darkmode) {
                  setState(() => _darkMode = darkmode);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
