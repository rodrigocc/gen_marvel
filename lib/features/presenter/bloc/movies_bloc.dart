import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_test_marvel/features/data/models/mcu_list_model.dart';

import '../../domain/usecases/fetch_movie_list.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final FetchMovieListUseCase? getMovieListUseCase;
  MoviesBloc(this.getMovieListUseCase) : super(MoviesInitial()) {
    on<FetchMovieList>((event, emit) async {
      final result = await getMovieListUseCase!(event.currentContext);

      if (result.isRight()) {
        emit(MovieListLoaded(movielist: result.getOrElse(() => [])));
      } else {
        emit(MovieListLoadingError(errorMsg: 'Erro'));
      }
    });
  }
}
