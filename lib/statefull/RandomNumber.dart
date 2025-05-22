import 'dart:math';
import 'package:flutter/material.dart';

class RandomNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RandomNumberWidget(),
    );
  }
}

class RandomNumberWidget extends StatefulWidget{
  _RandomNumberWidgetState createState()
  => _RandomNumberWidgetState();
}

class _RandomNumberWidgetState extends State<RandomNumberWidget>{
  int randomNumber = 0;

  void generateRandom(){
    setState(() {
      randomNumber = Random().nextInt(100);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gerador de número"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Número: $randomNumber",
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: generateRandom,
              child: Text("Gerar número"),
            )
          ],
        ),
      ),
    );
  }
}
