
import 'package:al_planner/screens/home_screen.dart';
import 'package:al_planner/screens/pathing_screen.dart';
import 'package:al_planner/src/rust/frb_generated.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue, backgroundColor: const Color(0xfffdfdfd), cardColor: Colors.grey[600]),
      ),
      home: const HomeScreen(),
    );
  }
}

