import 'package:crussqlite/ui/HomeScreen.dart';
import 'package:crussqlite/ui/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Data Mahasiswa",
        color: Colors.green,
        debugShowCheckedModeBanner: false,
        home: SplassScreen());
  }
}
