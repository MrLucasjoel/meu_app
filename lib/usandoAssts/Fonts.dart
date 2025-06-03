import 'package:flutter/material.dart';

class Fonts extends StatelessWidget {
  const Fonts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Assets",
      home: Scaffold(
        appBar: AppBar(title: Text("Usando Fonts"),),
        body: Center(
          child: Text(
            "Fonts Asset",
            style: TextStyle(fontFamily: "AlumniSansSC", fontSize: 30),
          ),
        ),
      ),
    );
  }
}