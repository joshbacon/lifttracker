import 'package:flutter/material.dart';
import 'package:lifttracker/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          surface: Colors.grey[900] ?? Colors.grey,
          onSurface: Colors.grey,
          primary: const Color.fromARGB(255, 159, 25, 215),
          onPrimary: Colors.black,
          secondary: Colors.purple[600] ?? Colors.purple,
          onSecondary: Colors.black,
          error: Colors.deepOrange,
          onError: Colors.black,
        ),
        useMaterial3: true,
        fontFamily: "dubai",
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
