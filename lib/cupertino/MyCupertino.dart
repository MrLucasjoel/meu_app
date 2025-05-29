import 'package:flutter/cupertino.dart';
import 'package:meu_app/cupertino/TelaCupertino.dart';

class Mycupertino extends StatelessWidget {
  const Mycupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: "Aplicativo com cupertino",
      home: Telacupertino(),
    );
  }
}