import 'package:flutter/material.dart';
import 'resposta.dart';
import 'questao.dart';

class Questionario extends StatelessWidget {
  const Questionario(
      {super.key,
      required this.perguntaSelecionada,
      required this.perguntas,
      required this.responder});

  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) responder;

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
            as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'] as String,
            () => responder(int.parse(resp['pontuacao'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
