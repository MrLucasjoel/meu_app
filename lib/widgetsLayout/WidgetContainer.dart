import 'package:flutter/material.dart';

/**
 * Widget container é um bloco de construção visual que permite
 * controlar layout, espaçamento, cor, bordas, transformação e muito
 * mais.
 * 
 * FUNÇÕES DO CONTAINER
 * width / height -> largura e altura fixas
 * padding -> espaço interno (preenchimento) dentro do container
 * margin -> espaço externo (fora do container)
 * color -> cor de fundo do container
 * alignment -> alinha o elemento filho dentro do conteiner
 * decoration -> estilo visual completo (cores, bordas, sombreamento e etc)
 * child -> o conteúdo do conteiner (filho)
 * constraints -> limita dimensões (mínimo e máximo)
 * transform -> aplica rotação, escala, transformação e etc
 */

class WidgetContainer extends StatelessWidget {
  const WidgetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      color: const Color.fromARGB(255, 13, 177, 87),
      alignment: Alignment.center,
      // child: Text("Container", style: TextStyle(fontSize: 35),),
      child: Container(
        width: 80,
        height: 80,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          border: Border.all(
            color: const Color.fromARGB(255, 217, 255, 0),
            width: 4
          ),
          borderRadius: BorderRadius.circular(12)
        ),
      ),
    );
  }
}