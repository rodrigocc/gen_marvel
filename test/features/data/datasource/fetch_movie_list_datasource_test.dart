import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen_test_marvel/config/local_client.dart';
import 'package:gen_test_marvel/features/data/datasource/fetch_movie_list_datasource.dart';
import 'package:gen_test_marvel/features/data/models/mcu_list_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mcu_mock.dart';

class ClientLocalMock extends Mock implements ILocalClient {}

class BuildContextMock extends Mock implements BuildContext {}

void main() async {
  late final FetchMovieListDataSource sut;
  late final ILocalClient clientlocal;
  late final BuildContextMock currentContext;

  setUpAll(() async {
    clientlocal = ClientLocalMock();
    sut = FetchMovieListDataSourceImpl(clientlocal);
    currentContext = BuildContextMock();
  });

  group('FetchMovieList DataSource', () {
    test('Shuold return a List<McuModel> in DataSource', () async {
      when((() => clientlocal.getAsset(any(), currentContext)))
          .thenAnswer((_) async => mcuMock);

      final result = await sut.fetchMovieList(currentContext);

      expect(result, isA<List<McuModel>>());
    });

    test(
        'Should return an DataSourceError When receiving an invalid response Error ',
        () {
      when(() => clientlocal.getAsset(any(), currentContext))
          .thenThrow(Exception());

      final result = sut.fetchMovieList(currentContext);

      expect(result, throwsA(isA<Exception>()));
    });
  });
}
