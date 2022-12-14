import '../../data/models/mcu_list_model.dart';

abstract class FetchMovieListUseCase {
  Future<List<McuModel>> fetchMovieList();
}

class FetchMovieListUseCaseImpl implements FetchMovieListUseCase {
  @override
  Future<List<McuModel>> fetchMovieList() {
    // TODO: implement fetchMovieList
    throw UnimplementedError();
  }
}
