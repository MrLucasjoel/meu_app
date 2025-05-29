import 'package:flutter/cupertino.dart';

class Telacupertino extends StatefulWidget {
  const Telacupertino({super.key});

  @override
  State<Telacupertino> createState() => _TelacupertinoState();
}

class _TelacupertinoState extends State<Telacupertino> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Barra superior"),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.line_horizontal_3),
          onPressed: () {

          },
        ),
      ),
      child: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 52, 199, 184),
            padding: const EdgeInsets.only(top: 90),
            child: const Center(
              child: Text("Corpo do cupertino scaffold"),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: const Color.fromARGB(255, 30, 158, 158),
              alignment: Alignment.center,
              child: const Text("Rodapé"),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CupertinoButton.filled(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Icon(CupertinoIcons.add),
                onPressed: () {

                },
              ),
            ),
          ),
        ]
      ),
    );
  }
}