import 'package:flutter/material.dart';
import 'package:gen_test_marvel/features/data/datasource/fetch_movie_list_datasource.dart';
import 'package:gen_test_marvel/features/data/models/mcu_list_model.dart';
import 'package:gen_test_marvel/config/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:gen_test_marvel/features/domain/repositories/movie_repository.dart';

class MovieListRepositoryImpl implements MovieListRepository {
  final FetchMovieListDataSource? fetchMovieListDataSource;

  MovieListRepositoryImpl({required this.fetchMovieListDataSource});

  @override
  Future<Either<Failure, List<McuModel>>> fetchMovielist(
      BuildContext context) async {
    try {
      final result = await fetchMovieListDataSource!.fetchMovieList(context);

      return Right(result);
    } on Exception {
      return Left(ResponseApiFailure());
    }
  }
}
