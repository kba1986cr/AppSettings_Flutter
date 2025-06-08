import 'package:appsettings_flutter/preferences_keys.dart';
import 'package:appsettings_flutter/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  bool darkMode = pref.getBool(PreferencesKeys.darkMode) ?? false;
  // runApp(
  //   MaterialApp(
  //     theme: darkMode ? ThemeData.dark() : ThemeData.light(),
  //     home: const MainApp(),
  //   ),
  // );
  runApp(MainApp(isdarkMode: darkMode));
}

class MainApp extends StatelessWidget {
  final bool isdarkMode;
  const MainApp({super.key, required this.isdarkMode});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isdarkMode ? ThemeData.dark() : ThemeData.light(),
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
