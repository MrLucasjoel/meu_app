import 'package:flutter/material.dart';
import 'package:meu_app/inherited/UserData.dart';

class UserInfos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserData(
      username: "Lucas",
      child: Scaffold(
        appBar: AppBar(title: Text("Perfil de usuário"),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WelcomeMessage(),
            SizedBox(height: 20,)
          ],
        )
      ),
    );
  }

}

class WelcomeMessage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final username = UserData.of(context).username;
    return Text("Bem vindo $username", style: TextStyle(fontSize: 24),);
  }
}