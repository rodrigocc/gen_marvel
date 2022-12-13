import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/movie_model.dart';

abstract class FetchMovieListDataSource {
  Future<List<Mcu>> fetchMovieList(BuildContext context);
}

class FetchMovieListDataSourceImpl implements FetchMovieListDataSource {
  @override
  Future<List<Mcu>> fetchMovieList(BuildContext context) async {
    final response =
        await DefaultAssetBundle.of(context).loadString('assets/mock.json');
    final data = jsonDecode(response) as Map<String, dynamic>;

    var result = Mcu.fromJsonList(data['mcu']);

    return result;
  }
}
