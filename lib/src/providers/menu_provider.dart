import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    //cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    /*
    rootBundle.loadString('data/menu_opts.json').then((data) {
      Map dataMap = json.decode(data);
      debugPrint(dataMap['rutas'].toString());
      opciones = dataMap['rutas'];
    } );*/

    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = jsonDecode(resp);
    //debugPrint(dataMap['rutas'].toString());
    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuProvider = _MenuProvider();
