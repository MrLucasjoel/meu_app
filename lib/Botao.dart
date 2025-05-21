import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(
      child: SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: (){},
        child: Center(
          child: Text(
            "Seu Botão",
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.cyan, fontSize: 20),
          )
        )
      )
      )
    );
  }
}