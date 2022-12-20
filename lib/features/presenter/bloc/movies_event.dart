part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class FetchMovieList extends MoviesEvent {
  final BuildContext currentContext;

  const FetchMovieList({
    required this.currentContext,
  });

  @override
  List<Object> get props => [
        currentContext,
      ];
}
