import 'dart:async';
import 'dart:ffi';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:crussqlite/database/services.dart';
import 'package:crussqlite/ui/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplassScreen extends StatefulWidget {
  DatabaseHelper dba = new DatabaseHelper();

  @override
  _SplassScreenState createState() => _SplassScreenState();
}

class _SplassScreenState extends State<SplassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.greenAccent[200],
                    Colors.greenAccent,
                    Colors.greenAccent,
                    Colors.greenAccent[200],
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Aplikasi Data Mahasiswa",style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: "Billion",
                    color: Colors.white),),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ignore: missing_return
  Future<Timer> starTme() async {
    return Timer(Duration(seconds: 6), OnDone);
  }

  Void OnDone() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  void initState() {
    starTme();
    super.initState();
  }
}
