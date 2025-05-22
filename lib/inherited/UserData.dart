import 'package:flutter/material.dart';

class UserData extends InheritedWidget {
  final String username;

  const UserData({
    required this.username,
    required Widget child //widget filho que herda o nome
  }) : super(child: child); //passa o filho para o construtor pai

/*
este método estatico pode ser chamadp independente de termos instanciado o
objeto ou não.
definimos um método estatico chamado of
isso significa que você pode chamar UserData.of(context) sem precisar de uma 
isntancia de UserData. 
quem chamar vai receber um BuildContext, ou seja o contexto onde o widget está 
na árvore. 
*/
  static UserData of(BuildContext context){
    final result = context.dependOnInheritedWidgetOfExactType<UserData>();
    return result!;
  }

  @override
  bool updateShouldNotify(UserData oldwidget){
    return oldwidget.username != username;
  }
}