import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  const Resultado(this.pontuacao, {super.key});

  String get fraseResultado {
    if (pontuacao < 10) {
      return 'Parabéns';
    } else if (pontuacao < 20) {
      return 'Você é bom';
    } else if (pontuacao < 30) {
      return 'Impressionante';
    } else {
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Parabéns',
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
