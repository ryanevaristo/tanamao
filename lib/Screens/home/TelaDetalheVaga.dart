import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tanamao/api/api.dart';
import 'package:open_whatsapp/open_whatsapp.dart';
import 'package:tanamao/Screens/home/TelaVaga.dart';

class TelaVagaDetalhes extends StatefulWidget {
  final String idVaga;

  const TelaVagaDetalhes({Key key, this.idVaga}) : super(key: key);

  @override
  _TelaVagaDetalhesState createState() => _TelaVagaDetalhesState();
}

class _TelaVagaDetalhesState extends State<TelaVagaDetalhes> {
  String id;
  String _urlBase = "https://industria-banco-de-dados.herokuapp.com";

  List<Vaga> _vaga;
  Future<List<Vaga>> _getProfissional() async {
    try {
      List<Vaga> listVaga = [];
      final response =
          await http.get(_urlBase + "/api/vaga/?id=${widget.idVaga}");

      if (response.statusCode == 200) {
        String source = Utf8Decoder().convert(response.bodyBytes);
        final decodeJson = jsonDecode(source);

        for (var item in decodeJson) {
          listVaga.add(Vaga.fromJson(item));
        }
        return listVaga;
      } else {
        print("Error ao carregar lista!");
        return null;
      }
    } catch (e) {
      print("Error ao carregar lista!");
      return _telaError();
    }
  }

  _telaError() {
    return Center(
      child: Text(" Verifique sua Internet "),
    );
  }

  @override
  void initState() {
    super.initState();
    _getProfissional().then((map) {
      _vaga = map;
      print("teste teste teste $_vaga");
    });
  }

  final Color azul = Color(0xFF38b6ff);
  final Color roxo = Color(0xFF5e17eb);
  final Color roxoClaro = Color(0xFF8122ef);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //CABEÇALHO APLICATIVO
      appBar: AppBar(
        backgroundColor: azul,
        title: Text(
          "Detalhes do Vaga",
          style: TextStyle(fontSize: 22),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: FutureBuilder<List<Vaga>>(
        future: _getProfissional(),
        // ignore: missing_return
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );

            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasError) {
                _telaError();
                print("lista: Erro ao carregar ");
              } else {
                print("lista: carregou!! ");
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      List<Vaga> lista = snapshot.data;
                      Vaga item = lista[index];

                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  decoration: BoxDecoration(
                                    color: azul,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Image.network(
                                              " ",
                                              width: 160,
                                              height: 160,
                                            ),
                                          ],
                                        ),
                                        //Nome Vaga e avaliação
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 6),
                                          child: Text(
                                            item.nomeVaga,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontFamily: 'gagalin',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                //SEGUNDA COLUNA
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  decoration: BoxDecoration(
                                    color: roxo,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),
                                //TERCEIRA COLUNA
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  decoration: BoxDecoration(
                                    color: azul,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 30),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/img/mensagem.png",
                                          width: 70,
                                          height: 70,
                                          color: Colors.white,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 46, left: 10),
                                              child: Text(
                                                "",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 10),
                                              child: Text(
                                                'item',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  decoration: BoxDecoration(
                                    color: roxo,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 30, right: 10),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/img/contato.png",
                                          width: 40,
                                          height: 40,
                                          color: Colors.white,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 46),
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 180,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/img/container.png"),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 0),
                                                  child: Text(
                                                    item.descricao,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'gagalin',
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(),
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 200,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/img/container.png"),
                                                  ),
                                                ),
                                                child: Text(
                                                  'item.emailProfissional',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'gagalin',
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  decoration: BoxDecoration(
                                    color: azul,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 30),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          "assets/img/local.png",
                                          width: 70,
                                          height: 70,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 50),
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: 230,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/img/container.png"),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 0),
                                                  child: Text(
                                                    item.descricao,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'gagalin',
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  decoration: BoxDecoration(
                                    color: roxo,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/img/whatsapp.png",
                                              width: 50,
                                              height: 50,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: TextButton(
                                                onPressed: () {
                                                  FlutterOpenWhatsapp
                                                      .sendSingleMessage(
                                                          "55${'item.contato'}",
                                                          "Olá,  sou cliente do ta na mão e gostaria de adquirir seus serviços!");
                                                },
                                                child: const Text(
                                                  'WHATSAPP',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontFamily: 'gagalin',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: TextButton(
                                                onPressed: () {
                                                  FlutterOpenWhatsapp
                                                      .sendSingleMessage(
                                                          "55${'item.contato'}",
                                                          "Olá,  sou cliente do ta na mão e gostaria de adquirir seus serviços!");
                                                },
                                                child: const Text(
                                                  'EMAIL',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontFamily: 'gagalin',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //OBJETOS SOBREPOSTOS
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height /
                                        65),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  height:
                                      MediaQuery.of(context).size.height / 21,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "AVALIAÇÃO: ",
                                        style: TextStyle(
                                          fontFamily: "gagalin",
                                          fontSize: 20,
                                        ),
                                      ),
                                      Image.asset(
                                        "assets/img/estrela.png",
                                        width: 180,
                                        height: 180,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height /
                                        4.5),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  height:
                                      MediaQuery.of(context).size.height / 21,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "EMITE NOTA FISCAL ?: SIM ",
                                        style: TextStyle(
                                          fontFamily: "gagalin",
                                          fontSize: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.height / 7),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  height:
                                      MediaQuery.of(context).size.height / 21,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Como Entrar em Contato ? ",
                                        style: TextStyle(
                                          fontFamily: "gagalin",
                                          fontSize: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.height / 5),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  height:
                                      MediaQuery.of(context).size.height / 21,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "ONDE PODE ATUAR ? ",
                                        style: TextStyle(
                                          fontFamily: "gagalin",
                                          fontSize: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    });
              }
              return null;
          }
        },
      ),
    );
  }
}
