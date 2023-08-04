import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Rosa', 'pontuacao': 5},
        {'texto': 'Vermelho', 'pontuacao': 25},
        {'texto': 'Verde', 'pontuacao': 2},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Águia', 'pontuacao': 50},
        {'texto': 'Tartaruga', 'pontuacao': 24},
        {'texto': 'Cachorro', 'pontuacao': 15},
        {'texto': 'Pato', 'pontuacao': 3},
      ],
    },
    {
      'texto': 'Qual é a sua cidade favorita?',
      'respostas': [
        {'texto': 'São Paulo', 'pontuacao': 5},
        {'texto': 'Curitiba', 'pontuacao': 90},
        {'texto': 'Belo Horizonte', 'pontuacao': 25},
        {'texto': 'Recife', 'pontuacao': 3},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
