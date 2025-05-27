import 'package:flutter/material.dart';

//void main() {
  //runApp(const GameScoreApp());
//}

class GameScoreApp extends StatefulWidget {
  const GameScoreApp({super.key});

  @override
  State<GameScoreApp> createState() => _GameScoreAppState();
}

class _GameScoreAppState extends State<GameScoreApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marcador de Jogos',
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomePage(
        isDarkMode: isDarkMode,
        onToggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marcador de Jogos'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: onToggleTheme,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Escolha o jogo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            GameButton(
              icon: Icons.sports_esports,
              text: 'Truco',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TrucoPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            GameButton(
              icon: Icons.casino,
              text: 'Cacheta',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CachetaPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            GameButton(
              icon: Icons.grid_view,
              text: 'Dominó',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DominoPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GameButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const GameButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 32),
      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Text(text, style: const TextStyle(fontSize: 20)),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
      ),
    );
  }
}

      //TRUCO....

class TrucoPage extends StatefulWidget {
  const TrucoPage({super.key});

  @override
  State<TrucoPage> createState() => _TrucoPageState();
}

class _TrucoPageState extends State<TrucoPage> {
  final Map<String, int> _pontos = {
    'Time A': 0,
    'Time B': 0,
  };

  void alterarPontos(String jogador, int delta) {
    setState(() {
      _pontos[jogador] = (_pontos[jogador]! + delta).clamp(0, 12);
      if (_pontos[jogador] == 12) {
        mostrarComemoracao(jogador);
      }
    });
  }

  void resetar() {
    setState(() {
      for (var key in _pontos.keys) {
        _pontos[key] = 0;
      }
    });
  }

  void mostrarComemoracao(String vencedor) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('🎉 Vitória!'),
        content: Text('$vencedor venceu o jogo!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              resetar();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Truco - Marcador'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: resetar,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _pontos.length,
        itemBuilder: (context, index) {
          String jogador = _pontos.keys.elementAt(index);
          int pontos = _pontos[jogador]!;

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 12),
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                children: [
                  Text(
                    jogador,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '$pontos',
                    style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => alterarPontos(jogador, -1),
                        icon: const Icon(Icons.remove_circle),
                        color: Colors.red,
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: () => alterarPontos(jogador, 1),
                        icon: const Icon(Icons.add_circle),
                        color: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

        //CACHETA....

class CachetaPage extends StatefulWidget {
  const CachetaPage({super.key});

  @override
  State<CachetaPage> createState() => _CachetaPageState();
}

class _CachetaPageState extends State<CachetaPage> {
  final Map<String, int> _pontos = {
    'A': 0,
    'B': 0,
    'C': 0,
    'D': 0,
    'E': 0,
  };

  void resetar() {
    setState(() {
      for (var jogador in _pontos.keys) {
        _pontos[jogador] = 0;
      }
    });
  }

  void alterarPontos(String jogador, int delta) {
    setState(() {
      _pontos[jogador] = (_pontos[jogador]! + delta).clamp(0, 12);
      
      // Verifica vitória
if (_pontos[jogador] == 12) {
  Future.delayed(Duration(milliseconds: 300), () {
    mostrarComemoracao(jogador);
  });
}
    });
  }

  @override
  Widget build(BuildContext context) {
    final jogadores = _pontos.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cacheta - Marcador'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: resetar,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: jogadores.length,
          itemBuilder: (context, index) {
            final jogador = jogadores[index];
            final pontos = _pontos[jogador]!;

            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: buildTimeCard(
                'Jogador $jogador',
                pontos,
                () => alterarPontos(jogador, 1),
                () => alterarPontos(jogador, -1),
              ),
            );
          },
        ),
      ),
    );
  }

  void mostrarComemoracao(String jogador) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.green[100],
        title: const Text(
          '🎉 Vitória!',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Jogador $jogador venceu com 12 pontos!',
          style: const TextStyle(fontSize: 20),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              resetar();
            },
            child: const Text('Reiniciar'),
          ),
        ],
      );
    },
  );
}

  Widget buildTimeCard(
      String nome, int pontos, VoidCallback onAdd, VoidCallback onRemove) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            Text(
              nome,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '$pontos',
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onRemove,
                  icon: const Icon(Icons.remove_circle),
                  color: Colors.red,
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: onAdd,
                  icon: const Icon(Icons.add_circle),
                  color: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


          //DOMINÓ....

class DominoPage extends StatefulWidget {
  const DominoPage({super.key});

  @override
  State<DominoPage> createState() => _DominoPageState();
}

class _DominoPageState extends State<DominoPage> {
  final Map<String, int> _pontos = {
    'Time A': 0,
    'Time B': 0,
  };

  final int limitePontos = 100;

  void alterarPontos(String jogador, int delta) {
    setState(() {
      _pontos[jogador] = (_pontos[jogador]! + delta).clamp(0, limitePontos);
      if (_pontos[jogador] == limitePontos) {
        mostrarComemoracao(jogador);
      }
    });
  }

  void resetar() {
    setState(() {
      for (var key in _pontos.keys) {
        _pontos[key] = 0;
      }
    });
  }

  void mostrarComemoracao(String vencedor) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('🎊 Vitória no Dominó!'),
        content: Text('$vencedor venceu com $limitePontos pontos!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              resetar();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dominó - Marcador'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: resetar,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _pontos.length,
        itemBuilder: (context, index) {
          String jogador = _pontos.keys.elementAt(index);
          int pontos = _pontos[jogador]!;

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 12),
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                children: [
                  Text(
                    jogador,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '$pontos',
                    style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => alterarPontos(jogador, -1),
                        icon: const Icon(Icons.remove_circle),
                        color: Colors.red,
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: () => alterarPontos(jogador, 1),
                        icon: const Icon(Icons.add_circle),
                        color: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}