
import 'dart:convert';
import 'dart:async';

import 'package:coffee/models/BrewingMethod.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List> loadAsset(String file) async {
  String raw = await rootBundle.loadString(file);
  List configData = json.decode(raw);
  return configData;
}

Future<List<BrewingMethod>> parseMethods() async {
  List rawSource = await loadAsset('assets/coffee.json');
  List<BrewingMethod> list = new List();
  for (var value in rawSource) {
    list.add(BrewingMethod.fromJson(value));
  }
  return list;
}