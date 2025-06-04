import 'package:flutter/material.dart';

/*
FORMATOS DE IMAGENS ACEITOS PELO FLUTTER
PNG, JPEG/JPG, GIF, WEBP, BMP, WBMP, ICO, SVG, HEIF/HEIC
SVG - NÃO É NATIVO (PRECISA DE BIBLIOTECA)
HEIF/HEIC - NÃO É NATIVO (PRECISA DE BIBLIOTECA) 
*/

class Imagem extends StatelessWidget {
  const Imagem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Imagens no app",
      home: Scaffold(
      appBar: AppBar(
        title: Text("Inserindo imagem"),
      ),
      body: Center(
        child: Image.asset("assets/icon/dragon.jpg", width: 400,),
      ),
      ),
    );
  }
}