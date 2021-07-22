import 'package:flutter/material.dart';
import 'screens/Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Movie App",
        theme: ThemeData(
          backgroundColor: Colors.white,
        ),
        home: Homepage());
  }
}
