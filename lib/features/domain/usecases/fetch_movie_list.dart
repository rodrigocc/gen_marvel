import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../config/error/failure.dart';
import '../../../config/usecases/async_usecase.dart';
import '../../data/models/mcu_list_model.dart';
import '../repositories/movie_repository.dart';

class FetchMovieListUseCase
    implements AsyncListUseCase<McuModel, BuildContext> {
  final MovieListRepository? movieListRepository;

  FetchMovieListUseCase(this.movieListRepository);

  @override
  Future<Either<Failure, List<McuModel>>> call(params) async =>
      await movieListRepository!.fetchMovielist(params);
}
