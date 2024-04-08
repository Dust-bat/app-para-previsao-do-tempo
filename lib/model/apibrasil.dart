import 'dart:async';
import 'dart:convert';
//import 'dart:ffi';
//mport 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiBrasil {
  String nameCidade;
  //int code;

  ApiBrasil(this.nameCidade);

  Future<Map<String, dynamic>> getCidades() async {
    if (nameCidade == '') {
      nameCidade = 'error404';
    }
    final resposta = await http.get(
      Uri.parse('https://brasilapi.com.br/api/cptec/v1/cidade/$nameCidade'),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
    );

    if (resposta.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(resposta.body);
      if (jsonData.isNotEmpty) {
        return jsonData[0] as Map<String, dynamic>;
      }
    }
    return jsonDecode(resposta.body) as Map<String, dynamic>;

    //return null;
  }

  Future<Map<String, dynamic>> getCodCidade() async {
    final dadosCidade = await getCidades();
    final idCidade = dadosCidade['id'];

    final resposta = await http.get(
      Uri.parse(
          'https://brasilapi.com.br/api/cptec/v1/clima/previsao/${idCidade}/6'),
      headers: {'Content-Type': 'Application/json; charset=utf-8'},
    );
    if (idCidade != null && resposta.statusCode == 200) {
      return jsonDecode(resposta.body) as Map<String, dynamic>;
    } else {
      return jsonDecode(resposta.body) as Map<String, dynamic>;
    }
  }
}
