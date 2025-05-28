import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "SEJA BEM-VINDO",
      debugShowCheckedModeBanner: false,
      home: Menu(),

    );
  }
}

class MyMenu extends StatefulWidget {
  const MyMenu({super.key});

  @override
  State<MyMenu> createState () => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SEJA BEM-VINDO")),
      body: Text("Corpo do aplicativo"),
      backgroundColor: const Color.fromARGB(255, 5, 151, 107),
    );
  }
}