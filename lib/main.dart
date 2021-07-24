import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/Homepage.dart';
import 'appstate/AppState.dart';

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
      home: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Homepage(),
      ),
    );
  }
}
