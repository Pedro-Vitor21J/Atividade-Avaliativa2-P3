import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  const Resultado({super.key});

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Resultado',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Text('Com base nas suas respostas, concluímos que você é'),
          Text('O ASSASINO'),
        ],
      ),
    );
  }
}
