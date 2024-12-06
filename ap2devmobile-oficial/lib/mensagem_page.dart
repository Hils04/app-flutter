/// Importa os widgets do Material Design para a interface do usuário.
import 'package:flutter/material.dart';

/// Importa a biblioteca para gerar números aleatórios.
import 'dart:math';

/// Página de mensagens motivacionais, com a funcionalidade de gerar uma nova mensagem aleatória.
class MensagemPage extends StatefulWidget {
  @override
  _MensagemPageState createState() => _MensagemPageState();
}

/// Estado da página de mensagens motivacionais.
class _MensagemPageState extends State<MensagemPage> {
  /// Lista de mensagens motivacionais.
  final List<String> _mensagens = [
    'Acredite em si mesmo e todo o resto se encaixará.',
    'Você é mais forte do que pensa.',
    'O sucesso é a soma de pequenos esforços repetidos dia após dia.',
    'A persistência é o caminho do êxito.',
    'As dificuldades preparam pessoas comuns para destinos extraordinários.',
    'A vida é 10% o que acontece com você e 90% como você reage a isso.',
    'O único lugar onde o sucesso vem antes do trabalho é no dicionário.',
    'Você nunca sabe que resultados virão da sua ação. Mas se você não fizer nada, não haverá resultados.'
  ];

  /// Mensagem atual exibida na tela.
  String _mensagemAtual = '';

  /// Função para gerar uma nova mensagem aleatória.
  void _gerarNovaMensagem() {
    final random = Random();
    setState(() {
      _mensagemAtual = _mensagens[random.nextInt(_mensagens.length)];
    });
  }

  /// Inicializa o estado da página, gerando uma mensagem inicial.
  @override
  void initState() {
    super.initState();
    _gerarNovaMensagem();
  }

  /// Constrói a interface da página de mensagens motivacionais.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barra de app com título.
      appBar: AppBar(
        title: Text(
          'Mensagens Motivacionais',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff1259f2),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /// Exibe a mensagem motivacional atual.
            Text(
              _mensagemAtual,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            /// Botão para gerar uma nova mensagem motivacional.
            ElevatedButton(
              onPressed: _gerarNovaMensagem,
              child: Text(
                'Nova Mensagem',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(50, 70),
                backgroundColor: Color(0xffe5eff8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
