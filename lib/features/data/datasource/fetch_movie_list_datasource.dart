import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/mcu_list_model.dart';

abstract class FetchMovieListDataSource {
  Future<List<McuModel>> fetchMovieList(BuildContext context);
}

class FetchMovieListDataSourceImpl implements FetchMovieListDataSource {
  @override
  Future<List<McuModel>> fetchMovieList(BuildContext context) async {
    final response =
        await DefaultAssetBundle.of(context).loadString('assets/mock.json');
    final data = jsonDecode(response) as Map<String, dynamic>;

    var result = McuModel.fromJsonList(data['mcu']);

    return result;
  }
}
