import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Resultado extends StatefulWidget {
  const Resultado({super.key});

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  String resultado = '';

  Future<void> carregarDados() async {
    final preference = await SharedPreferences.getInstance();

    List<String>? simContador = preference.getStringList('SimContador');
    int totalSim = simContador?.length ?? 0;

    setState(() {
      if (totalSim <= 1) {
        resultado = 'INOCENTE';
      }
      if (totalSim == 2) {
        resultado = 'SUSPEITO';
      }
      if (totalSim >= 3 && totalSim <= 4) {
        resultado = 'CÚMPLICE';
      }
      if (totalSim == 5) {
        resultado = 'O ASSASINO!';
      }
    });
  }

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Com base nas suas respostas, concluímos que você é:',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 20),
            Text(
              resultado,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              onPressed: () {
                carregarDados();
              },
              child: Text(
                'Mostrar Resultado',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
