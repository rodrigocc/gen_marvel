import 'package:gen_test_marvel/config/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:gen_test_marvel/config/usecases/async_usecase.dart';

import '../../../config/usecases/usecase_params.dart';
import '../../data/models/mcu_list_model.dart';
import '../repositories/movie_repository.dart';

class FetchMovieListUseCase implements AsyncListUseCase<McuModel, NoParams> {
  final MovieListRepository? movieListRepository;

  FetchMovieListUseCase(this.movieListRepository);

  @override
  Future<Either<Failure, List<McuModel>>> call(params) async =>
      await movieListRepository!.fetchMovielist();
}
