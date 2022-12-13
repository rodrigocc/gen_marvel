import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/fetch_movie_list.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final FetchMovieListUseCase? getMovieListUseCase;
  MoviesBloc(this.getMovieListUseCase) : super(MoviesInitial()) {
    on<MoviesEvent>((event, emit) {});
  }
}
