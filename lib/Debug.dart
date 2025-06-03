import 'package:flutter/material.dart';

class Debug extends StatelessWidget {
  final int numeroMaximo;
  const Debug({super.key, required this.numeroMaximo});

  List<Widget> gerarNumeros() {
    List<Widget> Items = [];
    for(int i = 1; i <= numeroMaximo;i++) {
      Items.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text("Número $i", style: const TextStyle(fontSize: 24),),
        ),
      );
    }
    return Items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Degugando código"),),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children:[],
      ),
    );
  }
}