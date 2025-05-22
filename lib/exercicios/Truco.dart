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

class TrucoPage extends StatefulWidget {
  const TrucoPage({super.key});

  @override
  State<TrucoPage> createState() => _TrucoPageState();
}

class _TrucoPageState extends State<TrucoPage> {
  int pontosA = 0;
  int pontosB = 0;

  void resetar() {
    setState(() {
      pontosA = 0;
      pontosB = 0;
    });
  }

  void alterarPontos(String time, int delta) {
    setState(() {
      if (time == 'A') {
        pontosA = (pontosA + delta).clamp(0, 12);
      } else {
        pontosB = (pontosB + delta).clamp(0, 12);
      }
    });
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
      body: buildPontuacao(),
    );
  }

  Widget buildPontuacao() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          buildTimeCard('Time A', pontosA, () => alterarPontos('A', 1), () => alterarPontos('A', -1)),
          const SizedBox(height: 30),
          buildTimeCard('Time B', pontosB, () => alterarPontos('B', 1), () => alterarPontos('B', -1)),
        ],
      ),
    );
  }

  Widget buildTimeCard(String nome, int pontos, VoidCallback onAdd, VoidCallback onRemove) {
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
                IconButton(onPressed: onRemove, icon: const Icon(Icons.remove_circle), color: Colors.red),
                const SizedBox(width: 20),
                IconButton(onPressed: onAdd, icon: const Icon(Icons.add_circle), color: Colors.green),
              ],
            )
          ],
        ),
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
  int pontosA = 0;
  int pontosB = 0;

  void resetar() {
    setState(() {
      pontosA = 0;
      pontosB = 0;
    });
  }

  void alterarPontos(String time, int delta) {
    setState(() {
      if (time == 'A') {
        pontosA = (pontosA + delta).clamp(0, 100);
      } else {
        pontosB = (pontosB + delta).clamp(0, 100);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            buildTimeCard('Jogador A', pontosA, () => alterarPontos('A', 1), () => alterarPontos('A', -1)),
            const SizedBox(height: 30),
            buildTimeCard('Jogador B', pontosB, () => alterarPontos('B', 1), () => alterarPontos('B', -1)),
          ],
        ),
      ),
    );
  }

  Widget buildTimeCard(String nome, int pontos, VoidCallback onAdd, VoidCallback onRemove) {
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
                IconButton(onPressed: onRemove, icon: const Icon(Icons.remove_circle), color: Colors.red),
                const SizedBox(width: 20),
                IconButton(onPressed: onAdd, icon: const Icon(Icons.add_circle), color: Colors.green),
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
  int pontosA = 0;
  int pontosB = 0;

  void resetar() {
    setState(() {
      pontosA = 0;
      pontosB = 0;
    });
  }

  void alterarPontos(String time, int delta) {
    setState(() {
      if (time == 'A') {
        pontosA = (pontosA + delta).clamp(0, 200);
      } else {
        pontosB = (pontosB + delta).clamp(0, 200);
      }
    });
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            buildTimeCard('Dupla A', pontosA, () => alterarPontos('A', 1), () => alterarPontos('A', -1)),
            const SizedBox(height: 30),
            buildTimeCard('Dupla B', pontosB, () => alterarPontos('B', 1), () => alterarPontos('B', -1)),
          ],
        ),
      ),
    );
  }

  Widget buildTimeCard(String nome, int pontos, VoidCallback onAdd, VoidCallback onRemove) {
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
                IconButton(onPressed: onRemove, icon: const Icon(Icons.remove_circle), color: Colors.red),
                const SizedBox(width: 20),
                IconButton(onPressed: onAdd, icon: const Icon(Icons.add_circle), color: Colors.green),
              ],
            )
          ],
        ),
      ),
    );
  }
}
