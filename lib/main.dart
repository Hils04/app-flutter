/// Importa os widgets do Material Design para a interface do usuário.
import 'package:flutter/material.dart';

/// Importa a página inicial do aplicativo.
import 'package:ap2devmobile/menu_page.dart';

/// Ponto de entrada do aplicativo.
void main() {
  runApp(
    MaterialApp(
      /// Remove o banner de depuração.
      debugShowCheckedModeBanner: false,

      /// Define a página inicial do aplicativo.
      home: MenuPage(),
    ),
  );
}
