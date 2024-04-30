import 'dart:convert';
import 'dart:io';

import 'package:projeto_json/Model/produtos_model.dart';

class ProdutoController {
  List<Produto> _produtos = [];

  List<Produto> get produtos {
    return _produtos;
  }

  //salvar os produtos no Json
  Future<void> salvarJson(Produto produto) async {
    final file = File('produtos.json');
    final jsonList = produto.map((produto) => produto.toJson()).toList();
    await file.writeAsString(json.encode(jsonList));
  }

  //carregar os produtos do Json
  Future<void> carregarJson() async {

    try {
    final file = File('produtos.json');
    final jsonList = await file.readAsString();
    _produtos = jsonList.map<Produto>(json) => Produto.fromJsonjson((json)).toList(); 
    } catch (e) {
      _produtos = [];
    }
    return produtos;
  }
}
