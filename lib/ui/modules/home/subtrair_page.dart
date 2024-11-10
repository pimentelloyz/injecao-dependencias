import 'package:flutter/material.dart';

import '../../../data/usecases/calculadora.dart';

// ignore: must_be_immutable
class SubtrairPage extends StatefulWidget {
  final Calculadora calculadora;

  const SubtrairPage({
    super.key,
    required this.calculadora,
  });

  @override
  State<SubtrairPage> createState() => _SubtrairPageState();
}

class _SubtrairPageState extends State<SubtrairPage> {
  TextEditingController firstValueController = TextEditingController();
  TextEditingController secoundValueController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                final resultadoDouble = widget.calculadora
                    .subtracao(valor1: valor1, valor2: valor2);

                result = resultadoDouble.toString();
                setState(() {});
              },
              child: const Text('Subtrair'),
            )
          ],
        ),
      ),
    );
  }
}
