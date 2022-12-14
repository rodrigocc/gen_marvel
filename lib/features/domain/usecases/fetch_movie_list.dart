import '../../data/models/mcu_list_model.dart';

abstract class FetchMovieListUseCase {
  Future<List<McuModel>> fetchMovieList();
}

class FetchMovieListUseCaseImpl implements FetchMovieListUseCase {

  final MovieListRepository? movieListRepository;

  FetchMovieListUseCaseImpl(this.movieListRepository);


  @override
  Future<List<McuModel>> fetchMovieList() async{

    await movieListRepository.

     
  }
}
