import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meu_app/trucoMarcador/Truco.dart';

void main() {
  runApp(const Menu());
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SEJA BEM-VINDO",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color.fromARGB(255, 103, 223, 187),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),
      themeMode: _themeMode,
      home: MyMenu(onToggleTheme: _toggleTheme, isDarkMode: _themeMode == ThemeMode.dark),
    );
  }
}

class MyMenu extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const MyMenu({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SEJA BEM-VINDO"),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: onToggleTheme,
          )
        ],
      ),
      body: const Center(child: Text("Corpo do aplicativo")),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text("Menu")),
            ListTile(
              title: Text("HOME"),
              subtitle: Text("Pagina Inicial"),
              leading: Icon(Icons.home),
              ),

              ListTile(
              title: Text("Perfil"),
              subtitle: Text("Acount"),
              leading: Icon(Icons.circle),
              
              ),

            ListTile(title: Text("PRODUTOS"),
              subtitle: Text("Livros"),
              leading: Icon(Icons.book)
            ),

            ListTile(title: Text("SERVIÇOS"),
              subtitle: Text("Configurações"),
              leading: Icon(Icons.settings)
            ),

            ListTile(title: Text("CONTATO"),
              subtitle: Text("(47) 99180-5041"),
              leading: Icon(Icons.phone),
            ),

            ListTile(title: Text("Logout"),
              subtitle: Text("Sair"),
              leading: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
    ),
    bottomNavigationBar: BottomAppBar(
        child: Padding(padding: EdgeInsets.all(16), child: Text("Rodapé"),),
    ),
    );
  }
}
