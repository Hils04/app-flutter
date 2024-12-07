/// Importa os widgets do Material Design para a interface do usuário.
import 'package:flutter/material.dart';

/// Importa a biblioteca para gerar números aleatórios.
import 'dart:math';

/// Página do jogo Jokenpô (Pedra, Papel e Tesoura).
class JokenpoPage extends StatefulWidget {
  @override
  _JokenpoPageState createState() => _JokenpoPageState();
}

/// Estado da página do Jokenpô.
class _JokenpoPageState extends State<JokenpoPage> {
  /// Imagem exibida como escolha do aplicativo.
  var _imageApp = AssetImage("images/Jogos/Jokenpo/padrao.png");

  /// Mensagem exibida no resultado do jogo.
  var _mensagem = "";

  /// Processa a escolha do jogador e determina o resultado do jogo.
  ///
  /// [escolhaUsuario] é a opção selecionada pelo jogador (pedra, papel ou tesoura).
  void _opcaoSelecionada(String escolhaUsuario) {
    /// Lista de opções disponíveis para o aplicativo.
    var opcoes = ["pedra", "papel", "tesoura"];

    /// Gera uma escolha aleatória para o aplicativo.
    int numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    /// Atualiza a imagem exibida com base na escolha do aplicativo.
    setState(() {
      _imageApp = AssetImage("images/Jogos/Jokenpo/$escolhaApp.png");
    });

    /// Determina o resultado do jogo.
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        _mensagem = "Parabéns! Você ganhou!";
      });
    } else if (escolhaUsuario == escolhaApp) {
      setState(() {
        _mensagem = "Empatamos!";
      });
    } else {
      setState(() {
        _mensagem = "Você perdeu!";
      });
    }
  }

  /// Constrói a interface do jogo.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barra superior com o título do jogo.
      appBar: AppBar(
        title: Text(
          "JokenPo",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff1259f2),
      ),

      /// Corpo principal do jogo.
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /// Texto indicando a escolha do aplicativo.
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do app",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /// Imagem exibindo a escolha do aplicativo.
          Image(image: _imageApp),

          /// Texto orientando o jogador a escolher uma opção.
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha uma opção abaixo",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /// Opções do jogador: Pedra, Papel e Tesoura.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  _opcaoSelecionada("pedra");
                },
                child:
                    Image.asset("images/Jogos/Jokenpo/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () {
                  _opcaoSelecionada("papel");
                },
                child:
                    Image.asset("images/Jogos/Jokenpo/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () {
                  _opcaoSelecionada("tesoura");
                },
                child: Image.asset("images/Jogos/Jokenpo/tesoura.png",
                    height: 100),
              ),
            ],
          ),

          /// Exibe o resultado do jogo.
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _mensagem,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
