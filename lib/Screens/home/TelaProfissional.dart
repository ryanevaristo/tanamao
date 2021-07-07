import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tanamao/Screens/home/telaDetalhes.dart';
import 'package:tanamao/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:tanamao/Screens/CustomSearchDelegate.dart';

class TelaProfissional extends StatefulWidget {
  final String idProfissao;
  const TelaProfissional({Key key, this.idProfissao}) : super(key: key);
  @override
  _TelaProfissionalState createState() => _TelaProfissionalState();
}

class _TelaProfissionalState extends State<TelaProfissional> {
  String _urlBase = "https://industria-banco-de-dados.herokuapp.com";
  List<Profissional> _profissional;
  Future<List<Profissional>> _getProfissional() async {
    try {
      List<Profissional> listProfissional = [];
      final response = await http
          .get(_urlBase + "/api/profissional/?profissao=" + widget.idProfissao);

      if (response.statusCode == 200) {
        String source = Utf8Decoder().convert(response.bodyBytes);
        final decodeJson = jsonDecode(source);

        for (var item in decodeJson) {
          listProfissional.add(Profissional.fromJson(item));
        }
        return listProfissional;
      } else {
        print("Error ao carregar lista!");
        return null;
      }
    } catch (e) {
      print("Error ao carregar lista!");
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _getProfissional().then((map) {
      _profissional = map;
      print("teste teste teste $_profissional");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          "Serviços",
          style: TextStyle(fontSize: 25),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search, size: 30),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              }),
        ],
      ),
      body: FutureBuilder<List<Profissional>>(
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
                print("lista: Erro ao carregar ");
              } else {
                print("lista: carregou!! ");
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      List<Profissional> lista = snapshot.data;
                      Profissional item = lista[index];

                      return Card(
                        child: ListTile(
                          title: Text(
                            item.nomeProfissional,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          leading: Image.network(item.fotoProfissional),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 30,
                          ),
                          subtitle: Image.asset(
                            "assets/img/estrela.png",
                            width: 10,
                            height: 20,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TelaDetalhes(
                                        idProfissional: item.id.toString())));
                          },
                        ),
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
