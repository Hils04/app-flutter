/// Importa os widgets do Material Design para a interface do usuário.
import 'package:flutter/material.dart';

/// Importa a página da calculadora de combustível.
import 'package:ap2devmobile/combustivel.dart';

/// Importa a página de mensagens motivacionais.
import 'package:ap2devmobile/mensagem_page.dart';

/// Importa a página de jogos retrô.
import 'package:ap2devmobile/jogos_retro_page.dart';

/// Página principal do menu.
class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Configura o AppBar com título centralizado e estilo.
      appBar: AppBar(
        title: Center(
          child: Text(
            'Menu',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color(0xff1259f2),
      ),

      /// Configura o corpo do menu com rolagem e botões.
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              /// Botão para a Calculadora de Combustível.
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
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
                      Image.asset(
                        'images/Combustivel/bomba-de-gasolina.png',
                        height: 50,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Calculadora de Combustível',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),

              /// Botão para a página de Mensagens Motivacionais.
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MensagemPage()),
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
                      Icon(Icons.message, size: 50),
                      SizedBox(width: 20),
                      Text(
                        'Mensagens Motivacionais',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),

              /// Botão para a página de Jogos Retrô.
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JogosRetroPage()),
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
                      Image.asset(
                        'images/Jogos/Cara_ou_Coroa/pasta-do-jogo.png',
                        height: 50,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Jogos Retrô',
                        style: TextStyle(fontSize: 16),
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
