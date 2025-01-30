import 'package:flutter/material.dart';
import 'home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Contact List',
      color: Colors.deepPurpleAccent,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}