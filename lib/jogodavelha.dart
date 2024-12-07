/// Importa os widgets do Material Design para construção da interface do usuário.
import 'package:flutter/material.dart';

/// Página do Jogo da Velha com a lógica do jogo e interface.
class JogodavelhaPage extends StatefulWidget {
  @override
  State<JogodavelhaPage> createState() => _JogodavelhaPageState();
}

class _JogodavelhaPageState extends State<JogodavelhaPage> {
  /// Grade do jogo representada como uma lista de listas de strings.
  List grade = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];

  /// Jogador atual: 'X' ou 'O'.
  String jogadorAtual = 'X';

  /// Texto informativo para o jogador.
  String textoInformativo = 'Vamos começar?';

  /// Controle se o jogo foi iniciado.
  bool jogoIniciado = false;

  /// Contador de jogadas realizadas.
  int jogadas = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barra de navegação com título "Jogo da Velha".
      appBar: AppBar(
        title: Text(
          'Jogo da Velha',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff1259f2),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),

            /// Absorve toques enquanto o jogo não é iniciado.
            AbsorbPointer(
              absorbing: !jogoIniciado,
              child: Column(
                children: [
                  /// Exibe as linhas do tabuleiro do Jogo da Velha.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myButton(linha: 0, coluna: 0),
                      myButton(linha: 0, coluna: 1),
                      myButton(linha: 0, coluna: 2),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myButton(linha: 1, coluna: 0),
                      myButton(linha: 1, coluna: 1),
                      myButton(linha: 1, coluna: 2),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myButton(linha: 2, coluna: 0),
                      myButton(linha: 2, coluna: 1),
                      myButton(linha: 2, coluna: 2),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            /// Exibe mensagem informativa sobre o estado do jogo.
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                textoInformativo,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            /// Botão de início ou reinício do jogo.
            AbsorbPointer(
              absorbing: jogoIniciado,
              child: Opacity(
                opacity: jogoIniciado ? 0 : 1,
                child: btInicio(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Método para construir um botão para cada célula do tabuleiro.
  Widget myButton({required int linha, required int coluna}) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: AbsorbPointer(
        absorbing: grade[linha][coluna] !=
            '', // Não permite interação se já houver um símbolo.
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              clique(
                  coluna: coluna,
                  linha: linha); // Chama a lógica do clique no botão.
            });
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(100, 100),
            backgroundColor: Color(0xffd0cccc),
          ),
          child: Text(
            grade[linha][coluna], // Exibe o símbolo 'X' ou 'O' na célula.
            style: TextStyle(fontSize: 50, color: Colors.black),
          ),
        ),
      ),
    );
  }

  /// Botão de início ou reinício do jogo.
  Widget btInicio() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          jogoIniciado = true; // Marca o início do jogo.
          jogadas = 0; // Zera as jogadas.
          grade = List.generate(
              3, (i) => List.filled(3, '')); // Reinicializa a grade.
          textoInformativo =
              '$jogadorAtual é a sua vez.'; // Atualiza a mensagem.
        });
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(300, 70),
        backgroundColor: Color(0xffe5eff8),
      ),
      child: Text(
        jogadas > 0
            ? "Jogar novamente."
            : "Vamos Jogar!", // Muda o texto dependendo do estado do jogo.
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }

  /// Lógica a ser executada quando o jogador clica em uma célula.
  void clique({required int linha, required int coluna}) {
    jogadas++; // Incrementa a contagem de jogadas.
    grade[linha][coluna] =
        jogadorAtual; // Atualiza a grade com o símbolo do jogador atual.

    /// Verifica se o jogador atual venceu.
    bool existeVencedor =
        verificaVencedor(jogador: jogadorAtual, linha: linha, coluna: coluna);

    if (existeVencedor) {
      textoInformativo =
          '$jogadorAtual venceu!'; // Atualiza a mensagem se houver vencedor.
      jogoIniciado = false; // Finaliza o jogo.
    } else if (!existeVencedor && jogadas == 9) {
      textoInformativo = 'Empate!'; // Atualiza a mensagem em caso de empate.
      jogoIniciado = false; // Finaliza o jogo.
    } else {
      // Alterna o jogador atual entre 'X' e 'O'.
      jogadorAtual = jogadorAtual == 'X' ? 'O' : 'X';
      textoInformativo =
          '$jogadorAtual é a sua vez.'; // Atualiza a mensagem com o próximo jogador.

      /// Se for a vez do computador, faz a jogada automaticamente após um atraso.
      if (jogadorAtual == 'O') {
        Future.delayed(Duration(milliseconds: 500), () {
          jogadaComputador();
        });
      }
    }
  }

  /// Lógica para a jogada do computador.
  void jogadaComputador() {
    int? linha;
    int? coluna;

    /// Busca por uma jogada estratégica do computador (primeiro tenta vencer, depois bloqueia).
    var jogada = encontrarJogada('O');
    if (jogada != null) {
      linha = jogada[0];
      coluna = jogada[1];
    }

    if (linha == null && coluna == null) {
      jogada = encontrarJogada('X');
      if (jogada != null) {
        linha = jogada[0];
        coluna = jogada[1];
      }
    }

    if (linha == null && coluna == null && grade[1][1] == '') {
      linha = 1;
      coluna = 1; // Se o centro estiver vazio, o computador joga no centro.
    }

    if (linha == null && coluna == null) {
      final cantos = [
        [0, 0],
        [0, 2],
        [2, 0],
        [2, 2],
      ];
      for (var canto in cantos) {
        if (grade[canto[0]][canto[1]] == '') {
          linha = canto[0];
          coluna = canto[1];
          break;
        }
      }
    }

    if (linha == null && coluna == null) {
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (grade[i][j] == '') {
            linha = i;
            coluna = j; // Escolhe a próxima célula vazia.
            break;
          }
        }
      }
    }

    if (linha != null && coluna != null) {
      setState(() {
        clique(
            linha: linha!, coluna: coluna!); // Realiza a jogada do computador.
      });
    }
  }

  /// Encontra uma jogada vencedora ou de bloqueio.
  List<int>? encontrarJogada(String jogador) {
    for (int i = 0; i < 3; i++) {
      if (grade[i].where((e) => e == jogador).length == 2 &&
          grade[i].contains('')) {
        return [i, grade[i].indexOf('')];
      }

      List<String> coluna = [grade[0][i], grade[1][i], grade[2][i]];
      if (coluna.where((e) => e == jogador).length == 2 &&
          coluna.contains('')) {
        return [coluna.indexOf(''), i];
      }
    }

    List<String> diagonal1 = [grade[0][0], grade[1][1], grade[2][2]];
    if (diagonal1.where((e) => e == jogador).length == 2 &&
        diagonal1.contains('')) {
      return [diagonal1.indexOf(''), diagonal1.indexOf('')];
    }

    List<String> diagonal2 = [grade[0][2], grade[1][1], grade[2][0]];
    if (diagonal2.where((e) => e == jogador).length == 2 &&
        diagonal2.contains('')) {
      return [diagonal2.indexOf(''), 2 - diagonal2.indexOf('')];
    }

    return null;
  }

  /// Verifica se um jogador venceu após a jogada.
  bool verificaVencedor(
      {required String jogador, required int linha, required int coluna}) {
    if (grade[linha].every((e) => e == jogador)) return true; // Verifica linha.

    if ([grade[0][coluna], grade[1][coluna], grade[2][coluna]]
        .every((e) => e == jogador)) return true; // Verifica coluna.

    if ([grade[0][0], grade[1][1], grade[2][2]].every((e) => e == jogador) ||
        [grade[0][2], grade[1][1], grade[2][0]].every((e) => e == jogador)) {
      return true; // Verifica diagonais.
    }

    return false;
  }
}
