import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tanamao/Screens/CustomSearchDelegate.dart';
import 'package:tanamao/Screens/home/TelaProfissional.dart';
import 'package:http/http.dart' as http;
import 'package:tanamao/api/api.dart';

class TelaProfissao extends StatefulWidget {
  @override
  _TelaProfissaoState createState() => _TelaProfissaoState();
}

class _TelaProfissaoState extends State<TelaProfissao> {
  String _urlBase = "https://industria-banco-de-dados.herokuapp.com";
  List<Profissao> _profissao;
  Future<List<Profissao>> _getProfissao() async {
    try {
      List<Profissao> listProfissao = [];
      final response = await http.get(_urlBase + "/api/profissao/");
      if (response.statusCode == 200) {
        String source = Utf8Decoder().convert(response.bodyBytes);
        final decodeJson = jsonDecode(source);

        for (var item in decodeJson) {
          listProfissao.add(Profissao.fromJson(item));
        }
        return listProfissao;
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
    _getProfissao().then((map) {
      _profissao = map;
      print("teste teste teste $_profissao");
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
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              })
        ],
      ),
      body: FutureBuilder<List<Profissao>>(
        future: _getProfissao(),
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
                return null;
              } else {
                print("lista: carregou!! ");
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      List<Profissao> lista = snapshot.data;
                      Profissao item = lista[index];

                      return Card(
                        child: ListTile(
                          title: Text(
                            item.nomeProfissao,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          leading: Icon(
                            Icons.account_balance,
                            size: 30,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 30,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TelaProfissional(
                                        idProfissao: item.id.toString())));
                          },
                        ),
                      );
                    });
              }
          }
        },
      ),
    );
  }
}
