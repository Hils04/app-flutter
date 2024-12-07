import 'package:flutter/material.dart';
import 'dart:math';

/// Página principal do jogo Cara ou Coroa.
class CaraOuCoroaPage extends StatefulWidget {
  @override
  _CaraOuCoroaPageState createState() => _CaraOuCoroaPageState();
}

class _CaraOuCoroaPageState extends State<CaraOuCoroaPage> {
  /// Resultado do jogo (cara ou coroa).
  String _resultado = '';

  /// Escolha do usuário (cara ou coroa).
  String _escolhaUsuario = '';

  /// Placar do usuário.
  int _placarUsuario = 0;

  /// Placar da máquina.
  int _placarMaquina = 0;

  /// Função chamada ao clicar no botão de jogar.
  void _jogar() {
    if (_escolhaUsuario.isEmpty) {
      _showEscolhaAlert();
      return;
    }

    final random = Random();
    bool resultado = random.nextBool();
    String resultadoStr = resultado ? 'cara' : 'coroa';

    setState(() {
      _resultado = resultadoStr;
      if (_escolhaUsuario == _resultado) {
        _placarUsuario++; // Incrementa o placar do usuário se a escolha for correta.
      } else {
        _placarMaquina++; // Incrementa o placar da máquina se a escolha for errada.
      }
    });
  }

  /// Exibe um alerta pedindo para o usuário escolher entre cara ou coroa antes de jogar.
  void _showEscolhaAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Escolha necessária'),
          content: Text('Por favor, escolha Cara ou Coroa antes de jogar.'),
          actions: [
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /// Reseta o jogo, zerando os placares e o resultado.
  void _resetar() {
    setState(() {
      _resultado = '';
      _escolhaUsuario = '';
      _placarUsuario = 0;
      _placarMaquina = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barra de navegação com o título do jogo.
      appBar: AppBar(
        title: Text(
          'Cara ou Coroa',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff1259f2),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              /// Imagem do jogo Cara ou Coroa.
              Image.asset(
                'images/Jogos/Cara_ou_Coroa/cara-ou-coroa.png',
                height: 120,
              ),
              SizedBox(height: 30),

              /// Botões para o usuário escolher entre Cara ou Coroa.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _escolhaUsuario =
                            'cara'; // Define a escolha do usuário como "cara".
                      });
                    },
                    child: Text(
                      'Cara',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _escolhaUsuario == 'cara'
                          ? Color(0xff1259f2)
                          : Color(
                              0xffd0cccc), // Cor de fundo baseada na escolha.
                      foregroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _escolhaUsuario =
                            'coroa'; // Define a escolha do usuário como "coroa".
                      });
                    },
                    child: Text(
                      'Coroa',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _escolhaUsuario == 'coroa'
                          ? Color(0xff1259f2)
                          : Color(
                              0xffd0cccc), // Cor de fundo baseada na escolha.
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              /// Botão para jogar o jogo.
              ElevatedButton(
                onPressed: _jogar,
                child: Text(
                  'Jogar',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffe5eff8),
                  foregroundColor: Colors.black,
                ),
              ),

              /// Exibe o resultado do jogo, se houver.
              if (_resultado.isNotEmpty)
                Column(
                  children: <Widget>[
                    SizedBox(height: 30),
                    Text(
                      'Resultado: $_resultado',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 30),

              /// Exibe o placar atual do usuário e da máquina.
              Text(
                'Placar',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'Usuário',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$_placarUsuario',
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Máquina',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$_placarMaquina',
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),

              /// Botão para resetar o jogo.
              ElevatedButton(
                onPressed: _resetar,
                child: Text(
                  'Resetar',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
