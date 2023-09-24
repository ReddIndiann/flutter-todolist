import 'package:flutter/material.dart';
import 'package:todolistt/pages/config.dart';
import 'package:todolistt/pages/signin.dart';

void main() {
  LocalDB.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: signin(),
    );
  }
}
