import 'package:flutter/material.dart';

class User extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Cartão de usuário")),
        body: const Center(
          child: UserCard(
            nome: "Lucas Joel",
            email: "lucas.joel1628@gmail.com",
            avatarUrl: "https://avatars.githubusercontent.com/u/195806201?s=400&u=89e1c0f7ce985e6c4efe3c23c0c74ab3d5e5eea4&v=4",
            ), 
        )
        )
    );
  }
}

class UserCard extends StatelessWidget{
final String nome;
final String email;
final String avatarUrl;

  const UserCard({
    super.key,
    required this.nome,
    required this.email,
    required this.avatarUrl
});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 120,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(children: [
            CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
              radius: 30,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nome, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Text(email, style: TextStyle(fontSize: 15, color: Colors.cyan),)
              ]
            )
          ],)
          )
      )
    );
  }
}