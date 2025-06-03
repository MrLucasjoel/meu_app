import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  const Tela2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela 2"),),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("ir para tela 3"),
              onPressed: () {
              NavigationBar.pushNamed(context, '/Tela3'),
              },
            ),
            ElevatedButton(
              child:Text("Ir para a tela 1"),
              onPressed: (){
                Navigator.pushNamed(context, '/'),
              }
            )
          ],
        )
      ),
    );
  }
}