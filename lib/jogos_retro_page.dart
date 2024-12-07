/// Importa os widgets do Material Design para a interface do usuário.
import 'package:flutter/material.dart';

/// Importa a página do jogo Cara ou Coroa.
import 'package:ap2devmobile/cara_ou_coroa.dart';

/// Importa a página do jogo Jokenpô.
import 'package:ap2devmobile/jokenpo.dart';

/// Importa a página do jogo da Velha.
import 'package:ap2devmobile/jogodavelha.dart';

/// Página que lista os jogos retrô disponíveis.
class JogosRetroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barra superior com o título da página.
      appBar: AppBar(
        title: Text(
          'Jogos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff1259f2),
      ),

      /// Corpo da página, com uma lista de botões para os jogos.
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              /// Botão para o jogo Cara ou Coroa.
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CaraOuCoroaPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(50, 70),
                    backgroundColor: Color(0xffe5eff8),
                    foregroundColor: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      /// Imagem representando o jogo Cara ou Coroa.
                      Image.asset(
                        'images/Jogos/Cara_ou_Coroa/cara-ou-coroa.png',
                        height: 50,
                      ),
                      SizedBox(width: 20),

                      /// Texto do botão.
                      Text(
                        'Cara ou Coroa',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),

              /// Botão para o jogo Jokenpô.
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JokenpoPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(50, 70),
                    backgroundColor: Color(0xffe5eff8),
                    foregroundColor: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      /// Imagem representando o jogo Jokenpô.
                      Image.asset(
                        'images/Jogos/Cara_ou_Coroa/pasta-do-jogo.png',
                        height: 50,
                      ),
                      SizedBox(width: 20),

                      /// Texto do botão.
                      Text(
                        'JokenPo',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),

              /// Botão para o jogo da Velha.
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JogodavelhaPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(50, 70),
                    backgroundColor: Color(0xffe5eff8),
                    foregroundColor: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      /// Imagem representando o jogo da Velha.
                      Image.asset(
                        'images/Jogos/Jogodavelha/jogovelha.png',
                        height: 50,
                      ),
                      SizedBox(width: 20),

                      /// Texto do botão.
                      Text(
                        'Jogo da Velha',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
