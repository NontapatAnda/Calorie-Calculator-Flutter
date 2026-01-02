import 'package:flutter/material.dart';
import 'package:osu_app/pages/DairyPage.dart';
import 'package:osu_app/pages/FruitPage.dart';
import 'package:osu_app/pages/ProteinPage.dart';
import 'package:osu_app/pages/grianPage.dart';
import 'package:osu_app/pages/home.dart';
import 'package:osu_app/pages/VegetablesPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      routes: {
        '/vegetables': (context) => VegetableCategory(),
        '/fruit': (context) => FruitCategory(),
        '/protein': (context) => ProteinCategory(),
        '/grains': (context) => GrainCategory(),
        '/dairy': (context) => DairyCategory()
      },
    );
  }
}
