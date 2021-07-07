import 'package:flutter/material.dart';
import 'package:tanamao/Screens/SearchBar.dart';
import 'package:tanamao/Screens/home/tela_inicial.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ta na Mão',
      home: TelaInicial(),
    );
  }
}
