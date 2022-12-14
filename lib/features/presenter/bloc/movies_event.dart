part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class FetchMovieList extends MoviesEvent {
  final List<McuModel> movielist;
  final BuildContext currentContext;

  const FetchMovieList({required this.currentContext, required this.movielist});

  @override
  List<Object> get props => [currentContext, movielist];
}
