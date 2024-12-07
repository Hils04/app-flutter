import 'package:flutter/material.dart';

/// Página inicial da calculadora de combustível.
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Controlador para o campo de texto do preço do álcool.
  TextEditingController alcoolController = TextEditingController();

  /// Controlador para o campo de texto do preço da gasolina.
  TextEditingController gasolinaController = TextEditingController();

  /// Variável para armazenar o resultado da comparação entre preços.
  String _textoResultado = '';

  /// Função que realiza o cálculo e exibe o melhor combustível.
  void _calcularCombustivel() {
    /// Tenta converter o valor do preço do álcool para um número de ponto flutuante.
    var precoAlcool = double.tryParse(alcoolController.text);

    /// Tenta converter o valor do preço da gasolina para um número de ponto flutuante.
    var precoGasolina = double.tryParse(gasolinaController.text);

    /// Verifica se algum dos valores é inválido (não numérico).
    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            'Número inválido. Favor informar valores maiores que 0 e utilize (.) como separador decimal.'; // Exibe mensagem de erro
      });
      return;
    }

    /// Compara o preço do álcool com o da gasolina para definir o melhor combustível.
    setState(() {
      if ((precoAlcool / precoGasolina) < 0.7) {
        _textoResultado =
            "Melhor abastecer com Álcool"; // Exibe a recomendação de álcool.
      } else {
        _textoResultado =
            "Melhor abastecer com Gasolina"; // Exibe a recomendação de gasolina.
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Barra de navegação com o título da página.
      appBar: AppBar(
        title: Text(
          'Calculadora de Combustível',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff1259f2),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              /// Imagem de uma bomba de gasolina como ícone principal.
              Image.asset('images/Combustivel/bomba-de-gasolina.png',
                  height: 150),

              /// Campo de texto para o preço do álcool.
              TextField(
                controller: alcoolController,
                decoration: InputDecoration(
                  labelText: '  Preço do Álcool, ex: 4.04', // Texto da label.
                  prefixIcon: Image.asset('images/Combustivel/etanol.png',
                      height: 40), // Ícone de etanol.
                ),
                style: TextStyle(fontSize: 22),
                keyboardType: TextInputType.number, // Só aceita números.
              ),

              /// Campo de texto para o preço da gasolina.
              TextField(
                controller: gasolinaController,
                decoration: InputDecoration(
                  labelText: '  Preço da Gasolina, ex: 6.10', // Texto da label.
                  prefixIcon: Image.asset('images/Combustivel/gasolina.png',
                      height: 40), // Ícone de gasolina.
                ),
                style: TextStyle(fontSize: 22),
                keyboardType: TextInputType.number, // Só aceita números.
              ),

              /// Botão para realizar o cálculo.
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed:
                      _calcularCombustivel, // Chama a função de cálculo ao ser pressionado.
                  child: Text('Calcular',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    backgroundColor:
                        Color(0xffe5eff8), // Cor de fundo do botão.
                    foregroundColor: Colors.black, // Cor do texto.
                  ),
                ),
              ),

              /// Exibe o resultado do cálculo.
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  _textoResultado, // Exibe a variável de resultado.
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
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
