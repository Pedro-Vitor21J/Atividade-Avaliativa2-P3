import 'package:flutter/material.dart';
import 'package:atividade_avaliativa2_p3/pages/Questionario.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Questionario());
  }
}
