import 'package:flutter/material.dart';

class Questionario extends StatefulWidget {
  const Questionario({super.key});

  @override
  State<Questionario> createState() => _QuestionarioState();
}

class _QuestionarioState extends State<Questionario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Cor de fundo
      backgroundColor: Colors.white,

      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Questionário',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),

      body: Column(
        children: [

          //Pergutas(Início)
          Text('Telefonou para a vítima?'),
          TextField(),

          Text('Esteve no local do crime?'),
          TextField(),

          Text('Mora perto da vítima?'),
          TextField(),

          Text('Devia para a vítima?'),
          TextField(),

          Text('Já trabalhou com a vítima'),
          TextField(),
          //Pergutas(Fim)

          //Botão para salvar os dados
          ElevatedButton(onPressed: () {}, child: Text('Salvar respostas')),

          //Botão para ver o resultado. Leva para a página Resultado.dart 
          ElevatedButton(onPressed: () {}, child: Text('Ver resultado')),
        ],
      ),
    );
  }
}
