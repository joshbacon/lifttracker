import 'package:flutter/material.dart';
import 'package:lifttracker/models/grouplist.dart';
import 'package:lifttracker/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GroupList list = GroupList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(groupList: list),
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          surface: Color.fromARGB(255, 33, 33, 33),
          surfaceDim: Color.fromARGB(255, 17, 17, 17),
          onSurface: Colors.grey,
          primary: Color.fromARGB(255, 159, 25, 215),
          onPrimary: Colors.black,
          secondary: Color.fromARGB(255, 142, 36, 170),
          onSecondary: Colors.black,
          error: Colors.deepOrange,
          onError: Colors.black,
        ),
        useMaterial3: true,
        fontFamily: "dubai",
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: Color.fromARGB(255, 216, 216, 216),
            fontSize: 18,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
          titleLarge: TextStyle(
            color: Color.fromARGB(255, 216, 216, 216),
            fontSize: 24,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
          bodyLarge: TextStyle(
            color: Color.fromARGB(255, 216, 216, 216),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 17, 17, 17)),
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
