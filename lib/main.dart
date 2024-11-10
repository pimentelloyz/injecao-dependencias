import 'package:flutter/material.dart';

import 'data/usecases/calculadora.dart';
import 'ui/modules/home/soma_page.dart';
import 'ui/modules/home/subtrair_page.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  final calculadora = Calculadora();

  CalculadoraApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'soma',
      routes: {
        'soma': (_) => SomaPage(calculadora: calculadora),
        'subtracao': (_) => SubtrairPage(calculadora: calculadora),
      },
    );
  }
}
