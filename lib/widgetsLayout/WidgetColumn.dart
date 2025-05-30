import 'package:flutter/material.dart';
import 'package:meu_app/widgetsLayout/Box.dart';

/**
 * WIDGET COLUMN
 * é um widget usado para dispor widgets filhos verticalmente, um
 * embaixo do outro, dentro de um único eixo (o eixo vertical Y)
 * 
 * propriedades principais
 * children -> uma lista de widgets empilhados verticalmente
 * mainAxisalignment -> alinha os filhos no eixo vertical
 * crossAxisalignment -> alinha os filhos no eixo cruzado (horizontal)
 * mainAxisSize -> controla se a column ocupa todo o espaço ou apenas o necessário
 * textBiseLine -> necessário para o alinhamento de texto com crossAxisalignment.
 * baseline
 */

class WidgetColumn extends StatelessWidget {
  const WidgetColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column( //SingleChildScrollView
        
         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          /* children: [
            Text("Texto 1"),
            Text("Texto 2"),
            Container(
              width: 50,
              height: 50,
              color: Colors.deepOrange,
            ),
          ], */
          children: [
            Box(text: "BOX 1", backgroundColor: Colors.amberAccent),
            Box(text: "BOX 2", backgroundColor: Colors.blueAccent),
            Box(text: "BOX 3", backgroundColor: Colors.redAccent)
        
          ],
      ),
    );
  }
}