import 'package:flutter/material.dart';
import 'projeto.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz de Perguntas')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/imagens/dog1.png',
            ), // Image.asset
            SizedBox(height: 20),
            Text(
              'Bem-vindo ao Quiz App!',
              style: TextStyle(fontSize: 24),
            ), // Text
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaInicial()),
                );
              },
              child: Text('Iniciar Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}