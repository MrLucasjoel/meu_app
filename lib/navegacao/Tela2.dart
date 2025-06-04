import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  const Tela2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("tela 2"),),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("ir para tela 3"),
              onPressed: () {
              Navigator.pushNamed(context, '/tela3');
              },
            ),
            ElevatedButton(
              child:Text("ir para tela 1"),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              }
            )
          ],
        )
      ),
    );
  }
}