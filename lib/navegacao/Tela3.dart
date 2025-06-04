import 'package:flutter/material.dart';

class Tela3 extends StatelessWidget {
  const Tela3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("tela 3")),
        body: Center(
          child: ElevatedButton(
            onPressed:() {
              Navigator.pop(context);
          }, 
          child: Text('voltar para tela 2'),
        ),
      )
    );
  }
}