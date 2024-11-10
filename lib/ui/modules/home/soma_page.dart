import 'package:flutter/material.dart';

import '../../../data/usecases/calculadora.dart';

class Empresa {
  final String name;
  final List<Pessoa>? empregados;

  Empresa({
    required this.name,
    required this.empregados,
  });
}

class Pessoa {
  final String name;
  final int age;

  Pessoa({
    required this.name,
    required this.age,
  });
}

// ignore: must_be_immutable
class SomaPage extends StatefulWidget {
  final Calculadora calculadora;
  const SomaPage({
    super.key,
    required this.calculadora,
  });

  @override
  State<SomaPage> createState() => _SomaPageState();
}

class _SomaPageState extends State<SomaPage> {
  TextEditingController firstValueController = TextEditingController();
  TextEditingController secoundValueController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('subtracao');
              },
              icon: const Icon(Icons.notification_add))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: firstValueController,
            ),
            TextFormField(
              controller: secoundValueController,
            ),
            Text(result),
            TextButton(
              onPressed: () {
                final valor1 =
                    double.tryParse(firstValueController.text) ?? 0.0;
                final valor2 =
                    double.tryParse(secoundValueController.text) ?? 0.0;

                final resultadoDouble =
                    widget.calculadora.somar(valor1: valor1, valor2: valor2);

                result = resultadoDouble.toString();
                setState(() {});
              },
              child: const Text('Somar'),
            )
          ],
        ),
      ),
    );
  }
}
