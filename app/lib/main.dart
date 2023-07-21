import 'package:flutter/material.dart';
import 'package:whizapp/editor/page/editor_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhizApp - Editor',
      theme: ThemeData(
        primaryColor: const Color(0xFF4F78FD),
        dividerColor: const Color.fromARGB(255, 230, 230, 230),
        textTheme: const TextTheme(
          labelMedium: TextStyle(
            color: Color.fromARGB(255, 158, 158, 158),
          ),
          labelLarge: TextStyle(
            color: Color.fromARGB(255, 158, 158, 158),
          ),
          labelSmall: TextStyle(
            color: Color.fromARGB(255, 158, 158, 158),
          ),
        ),
      ),
      home: EditorPage(),
    );
  }
}
