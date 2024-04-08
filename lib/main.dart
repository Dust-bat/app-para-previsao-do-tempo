import 'package:flutter/material.dart';
import 'package:previsao_tempo/view/index.dart';
import 'package:previsao_tempo/view/tela1.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Previsão do Tempo",
      initialRoute: '/',
      routes: {
        '/' : (context) => const Index(),
        '/tela1' : (context) => const Tela1(),
      },
    );
  }
}
