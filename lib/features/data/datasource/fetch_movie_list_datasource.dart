import 'dart:convert';

import 'package:gen_test_marvel/features/data/models/mcu_model.dart';

import '../../../json/movie_mock_api.dart';

abstract class FetchMovieListDataSource {
  List<Mcu> fetchMovieList();
}

class FetchMovieListDataSourceImpl implements FetchMovieListDataSource {
  @override
  List<Mcu> fetchMovieList() {
    final response = jsonDecode(movielist) as Map<String, dynamic>;

    var result = Mcu.fromJson(response);

    print(result);

    var result2 = McuList.fromJson(response);

    return result2.mcu;
  }
}
