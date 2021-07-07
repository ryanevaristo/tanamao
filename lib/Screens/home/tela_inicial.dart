import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tanamao/Screens/home/TelaProfissao.dart';
import 'package:tanamao/Screens/home/TelaSecretaria.dart';
import 'package:tanamao/Screens/home/TelaVaga.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final Color azul = Color(0xFF1cb0ee);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: azul,
        toolbarHeight: 15,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
        elevation: 0,
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15.0,
                  )
                ], color: azul),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        "Tá na Mão",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 1.1,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 35),
                alignment: Alignment.bottomCenter,
                child: Wrap(
                  spacing: 2,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 30,
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 4.5,
                        width: MediaQuery.of(context).size.width / 2.6,
                        child: Column(
                          children: [
                            Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: TextButton(
                                child: Image.asset(
                                  "assets/img/produtos-serviços.png",
                                  height: 100,
                                  width: 120,
                                  fit: BoxFit.fill,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TelaProfissao()));
                                },
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                            ),
                            Text(
                              "Prestador de Serviço",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 4.5,
                        width: MediaQuery.of(context).size.width / 2.6,
                        child: Column(
                          children: [
                            Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: TextButton(
                                child: Image.asset(
                                  "assets/img/Secretaria.png",
                                  height: 100,
                                  width: 120,
                                  fit: BoxFit.fill,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TelaSecretaria()));
                                },
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                            ),
                            Text("Secretárias Municipais",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, top: 20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 4.5,
                        width: MediaQuery.of(context).size.width / 2.6,
                        child: Column(
                          children: [
                            Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: TextButton(
                                child: Image.asset(
                                  "assets/img/vagas-emprego.png",
                                  height: 100,
                                  width: 120,
                                  fit: BoxFit.fill,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TelaVaga()));
                                },
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                            ),
                            Text("Vagas de Emprego",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 4.5,
                        width: MediaQuery.of(context).size.width / 2.6,
                        child: Column(
                          children: [
                            Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: TextButton(
                                child: Image.asset(
                                  "assets/img/faleconosco.png",
                                  height: 100,
                                  width: 120,
                                  fit: BoxFit.fill,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TelaProfissao()));
                                },
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                            ),
                            Text("Fale Conosco",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: Colors.blue[900],
          ),
          height: 80,
          child: Image.asset("assets/img/LOGO.png"),
        ),
      ),
    );
  }
}
