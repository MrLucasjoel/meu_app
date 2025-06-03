import 'package:flutter/material.dart';
import 'package:meu_app/navegacao/Tela1.dart';
import 'package:meu_app/navegacao/Tela2.dart';

class Routes extends StatelessWidget {
  const Routes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => const Tela1(),
        '/Tela2' : (context) => const Tela2(),
      },
    );
  }
}