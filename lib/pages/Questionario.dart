import 'package:atividade_avaliativa2_p3/pages/resultado.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Questionario extends StatefulWidget {
  const Questionario({super.key});

  @override
  State<Questionario> createState() => _QuestionarioState();
}

class _QuestionarioState extends State<Questionario> {
  //Scanea o teclado do usuário
  TextEditingController controllerResposta1 = TextEditingController();
  TextEditingController controllerResposta2 = TextEditingController();
  TextEditingController controllerResposta3 = TextEditingController();
  TextEditingController controllerResposta4 = TextEditingController();
  TextEditingController controllerResposta5 = TextEditingController();

  //Função para salvar os dados
  Future<void> salvarDados() async {
    final preference = await SharedPreferences.getInstance();

    String resposta1 = controllerResposta1.text.toLowerCase();
    String resposta2 = controllerResposta2.text.toLowerCase();
    String resposta3 = controllerResposta3.text.toLowerCase();
    String resposta4 = controllerResposta4.text.toLowerCase();
    String resposta5 = controllerResposta5.text.toLowerCase();

    List<String> simContador = [];
    if (resposta1 == 'sim') {
      simContador.add(resposta1);
    }
    if (resposta2 == 'sim') {
      simContador.add(resposta2);
    }
    if (resposta3 == 'sim') {
      simContador.add(resposta3);
    }
    if (resposta4 == 'sim') {
      simContador.add(resposta4);
    }
    if (resposta5 == 'sim') {
      simContador.add(resposta5);
    }

    //await preference.setString(key, value)
    await preference.setStringList('SimContador', simContador);

    //Limpa o formulário
    controllerResposta1.clear();
    controllerResposta2.clear();
    controllerResposta3.clear();
    controllerResposta4.clear();
    controllerResposta5.clear();

    //Teste
    print(simContador);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          TextField(
            controller: controllerResposta1,
            decoration: InputDecoration(),
          ),

          Text('Esteve no local do crime?'),
          TextField(
            controller: controllerResposta2,
            decoration: InputDecoration(),
          ),

          Text('Mora perto da vítima?'),
          TextField(
            controller: controllerResposta3,
            decoration: InputDecoration(),
          ),

          Text('Devia para a vítima?'),
          TextField(
            controller: controllerResposta4,
            decoration: InputDecoration(),
          ),

          Text('Já trabalhou com a vítima'),
          TextField(
            controller: controllerResposta5,
            decoration: InputDecoration(),
          ),
          //Pergutas(Fim)

          //Botão para salvar os dados
          ElevatedButton(
            onPressed: () {
              salvarDados();
            },
            child: Text('Salvar Respostas'),
          ),

          //Botão para ver o resultado. Leva para a página Resultado.dart
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Resultado()),
              );
            },
            child: Text('Ver Resultado'),
          ),
        ],
      ),
    );
  }
}
