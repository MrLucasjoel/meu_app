import 'package:flutter/material.dart';


class Loja extends StatefulWidget {
  const Loja({super.key});

  @override
  State<Loja> createState() => _LojaState();
}

class _LojaState extends State<Loja> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loja Flutter',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      home: LojaStatusPage(
        isDarkTheme: isDarkTheme,
        onThemeChanged: (valor) {
          setState(() {
            isDarkTheme = valor;
          });
        },
      ),
    );
  }
}

class LojaStatusPage extends StatefulWidget {
  final bool isDarkTheme;
  final ValueChanged<bool> onThemeChanged;

  const LojaStatusPage({
    super.key,
    required this.isDarkTheme,
    required this.onThemeChanged,
  });

  @override
  State<LojaStatusPage> createState() => _LojaStatusPageState();
}

class _LojaStatusPageState extends State<LojaStatusPage> {
  bool lojaAberta = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status da Loja'),
        actions: [
          Row(
            children: [
              Icon(widget.isDarkTheme ? Icons.dark_mode : Icons.light_mode),
              Switch(
                value: widget.isDarkTheme,
                onChanged: widget.onThemeChanged,
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ÍCONE DA LOJA NO TOPO
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Icon(
                Icons.storefront,
                size: 100,
                color: Color.fromARGB(255, 178, 241, 4),
              ),
            ),

            // FAIXA OU BANNER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 40, 224, 4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Bem-vindo à nossa loja!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // SWITCH DE STATUS
            SwitchListTile(
              title: const Text('Loja Aberta'),
              subtitle: Text(lojaAberta ? 'Aberta' : 'Fechada'),
              value: lojaAberta,
              onChanged: (bool valor) {
                setState(() {
                  lojaAberta = valor;
                });
              },
              activeColor: Colors.green,
              inactiveThumbColor: const Color.fromARGB(255, 175, 31, 5),
            ),

            const SizedBox(height: 20),

            // TEXTO DE STATUS DA LOJA
            Text(
              lojaAberta ? '🟢 A loja está aberta' : '🔴 A loja está fechada',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}