part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {}

class MoviesInitial extends MoviesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MovieListLoading extends MoviesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MovieListLoaded extends MoviesState {
  final List<McuModel> movielist;

  MovieListLoaded({required this.movielist});

  @override
  // TODO: implement props
  List<Object?> get props => [movielist];
}

class MovieListLoadingError extends MoviesState {
  final String? errorMsg;

  MovieListLoadingError({this.errorMsg});

  @override
  // TODO: implement props
  List<Object?> get props => [errorMsg];
}
