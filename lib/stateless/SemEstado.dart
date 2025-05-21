import 'package:flutter/material.dart';

class SemEstado extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Entra 21 Flutter",
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.greenAccent, fontSize: 30),
        ),
      ),
    );
  }

}