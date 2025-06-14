import 'package:flutter/material.dart';
import 'package:meu_app/dartAvancado/isolate/product_parse.dart';
// import 'package:meu_app/dartAvancado/future/login.dart';
// import 'package:meu_app/dartAvancado/stream/busca_com_stream.dart';
// import 'package:meu_app/Botao.dart';
// import 'package:meu_app/Debug.dart';
// import 'package:meu_app/MaterialWidget/MyMaterial.dart';
// import 'package:meu_app/cupertino/MyCupertino.dart';
// import 'package:meu_app/exercicios/ExercicioMaterial.dart';
// import 'package:meu_app/exercicios/Loja.dart';
// import 'package:meu_app/exercicios/Menu.dart';
// import 'package:meu_app/navegacao/Routes.dart';
// import 'package:meu_app/navegacao/Tela1.dart';
// import 'package:meu_app/testLucas/Loja1.dart';
// import 'package:meu_app/trucoMarcador/Truco.dart';
// import 'package:meu_app/inherited/UserInfos.dart';
// import 'package:meu_app/statefull/Contador.dart';
// import 'package:meu_app/statefull/DarkMode.dart';
// import 'package:meu_app/statefull/RandomNumber.dart';
// import 'package:meu_app/stateless/SemEstado.dart';
// import 'package:meu_app/stateless/User.dart';
// import 'package:meu_app/usandoAssts/Fonts.dart';
// import 'package:meu_app/usandoAssts/Imagem.dart';
// import 'dart:io';

// import 'package:meu_app/widgetsLayout/LayoutApp.dart';

/*
void main() {
  runApp(Container(
    child: Text(
      "Bem vindo ao Flutter",
      textDirection: TextDirection.ltr,
      style: TextStyle(color: Colors.greenAccent, fontSize: 30.0),
      ),
  ));
}
*/

/**
 * NO FLUTTER TEMOS 3 TIPOS DE ESTADOS DE APLICAÇÃO
 * STATELESS (ESTADO IMUTÁVEL)
 * A UI NUNCA APÓS SER CONSTRUÍDA
 * É USADO PARA COMPONENTES ESTÁTICOS COMO ÍCONES, TEXTOS FIXOS E ETC.
 * 
 * STATEFULL (ESTADO LOCAL)
 * A UI MUDA QUANDO O ESTADO INTERNO MUDA
 * É USADO EM WIDGETS QUE TEM INTERAÇÃO COM O USUÁRIO, COMO ENTRADAS
 DE TEXTOS, CARREGAMENTO DE DADOS, ANIMAÇÕES E ETC.
 *
 * INHERITED (ESTADO HERDADO)
 * COMPARTILHA DADOS DESCENDENTES NA ÁRVORES DE WIDGETS
 * ÚTIL PARA DADOS GLOBAIS LEVES COMO TEMAS, IDIOMAS E ETC.
 */

/*
void main(){
  //runApp(SemEstado());
  runApp(MaterialApp(
    home: Center(
      child: Botao(),
      )
  ));
}
*/

void main(){
  //runApp(User());

  //--EXEMPLO STATEFULL
  //runApp(MaterialApp(
    //home: Contador(), 
  //));

  //runApp(DarkMode());

  //runApp(RandomNumber());

  //runApp(UserInfos());

  //runApp(const Loja());

  //runApp(const GameScoreApp());

  //runApp(MyMaterial());

  // runApp(Menu());

  //runApp(Loja1());

//Cupertino
  // runApp(Mycupertino());

  //como decidir qual widget usar?

  /* if(Platform.isAndroid){
    runApp(MyMaterial());
  }else{
    runApp(Mycupertino());
  } */

//runApp(Layoutapp());

//runApp(Fonts());
//runApp(Imagem());

//runApp(const MaterialApp(home: Debug(numeroMaximo: 10)));


//NAVEGANDO ENTRE TELAS
//runApp(MaterialApp(home: Tela1(),));

//runApp(Routes());

//runApp(MaterialApp(home: Login()));
//runApp(MaterialApp(home: BuscaComStream()));

runApp(MaterialApp(home: ProductParse()));



}


