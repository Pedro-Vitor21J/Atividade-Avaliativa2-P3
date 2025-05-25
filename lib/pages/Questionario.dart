import 'package:atividade_avaliativa2_p3/pages/resultado.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Questionario extends StatefulWidget {
  const Questionario({super.key});

  @override
  State<Questionario> createState() => _QuestionarioState();
}

class _QuestionarioState extends State<Questionario> {
  //Ler o teclado do usuário
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

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20),

            // Iníco das pergutas
            Text(
              'Telefonou para a vítima?',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controllerResposta1,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 12,
                ),
              ),
            ),

            SizedBox(height: 20),

            Text('Esteve no local do crime?', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            TextField(
              controller: controllerResposta2,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 12,
                ),
              ),
            ),

            SizedBox(height: 20),

            Text('Mora perto da vítima?', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            TextField(
              controller: controllerResposta3,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 12,
                ),
              ),
            ),

            SizedBox(height: 20),

            Text('Devia para a vítima?', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            TextField(
              controller: controllerResposta4,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 12,
                ),
              ),
            ),

            SizedBox(height: 20),

            Text('Já trabalhou com a vítima?', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            TextField(
              controller: controllerResposta5,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 12,
                ),
              ),
            ),

            // Fim das pergutas
            SizedBox(height: 40),

            // Botão para salvar os dados
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: salvarDados,
              child: Text(
                'Salvar Respostas',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),

            SizedBox(height: 20),

            // Botão para ver o resultado
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Resultado()),
                );
              },
              child: Text(
                'Ver Resultado',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
