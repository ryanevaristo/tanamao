import 'dart:convert';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:tanamao/Screens/CustomSearchDelegate.dart';
import 'package:tanamao/Screens/home/TelaDetalheVaga.dart';
import 'package:http/http.dart' as http;
import 'package:tanamao/Screens/home/TelaDetalhesSec.dart';
import 'package:tanamao/api/api.dart';

class TelaSecretaria extends StatefulWidget {
  @override
  State<TelaSecretaria> createState() => _TelaSecretariaState();
}

class _TelaSecretariaState extends State<TelaSecretaria> {
  String _urlBase = "https://industria-banco-de-dados.herokuapp.com";
  List<Secretaria> _Secretaria;
  Future<List<Secretaria>> _getProfissao() async {
    try {
      List<Secretaria> listSecretaria = [];
      final response = await http.get(_urlBase + "/api/secretaria/");
      if (response.statusCode == 200) {
        String source = Utf8Decoder().convert(response.bodyBytes);
        final decodeJson = jsonDecode(source);

        for (var item in decodeJson) {
          listSecretaria.add(Secretaria.fromJson(item));
        }
        return listSecretaria;
      } else {
        print("Error ao carregar lista!");
        return null;
      }
    } catch (e) {
      print("Error ao carregar lista!");
      return null;
    }
  }

  static const historyLength = 5;

  List<String> _searchHistory = [
    'fuchsia',
    'flutter',
    'widgets',
    'resocoder',
  ];

  List<String> filteredSearchHistory;

  String selectedTerm;

  List<String> filterSearchTerms({
    @required String filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }

    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  FloatingSearchBarController controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: null);
    _getProfissao().then((map) {
      _Secretaria = map;
      print("teste teste teste $_Secretaria");
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(
          "Secretárias Municípais",
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
      body: FutureBuilder<List<Secretaria>>(
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
                      List<Secretaria> lista = snapshot.data;
                      Secretaria item = lista[index];

                      return Card(
                        child: ListTile(
                          title: Text(
                            item.nomeSecretaria,
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
                                    builder: (context) => TelaDetalhesSec(
                                        idSecretaria: item.id.toString())));
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
