import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gen_test_marvel/config/local_client.dart';

import '../models/mcu_list_model.dart';

abstract class FetchMovieListDataSource {
  Future<List<McuModel>> fetchMovieList(BuildContext context);
}

class FetchMovieListDataSourceImpl implements FetchMovieListDataSource {
  final ILocalClient _localClient;

  FetchMovieListDataSourceImpl(this._localClient);

  @override
  Future<List<McuModel>> fetchMovieList(BuildContext context) async {
    final response = await _localClient.getAsset('assets/mock.json', context);
    final data = jsonDecode(response) as Map<String, dynamic>;

    var result = McuModel.fromJsonList(data['mcu']);

    return result;
  }
}
