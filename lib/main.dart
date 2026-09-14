import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(113, 116, 255, 1.0),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
        ),

        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        fontFamily: 'Lato',
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
