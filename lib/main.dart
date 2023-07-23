import 'package:band_app/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        'home': (_) => const Home(),
      },
    );
  }
}
