import 'package:appsettings_flutter/settings_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          foregroundColor: Colors.red,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Configuración'.toUpperCase(),
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        body: SettingsScreen(),
      ),
    );
  }
}
