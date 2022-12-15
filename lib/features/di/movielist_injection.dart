import 'package:gen_test_marvel/config/injection_container.dart';
import 'package:gen_test_marvel/features/data/datasource/fetch_movie_list_datasource.dart';
import 'package:gen_test_marvel/features/data/repositories/movie_repository_impl.dart';
import 'package:gen_test_marvel/features/presenter/bloc/movies_bloc.dart';

import '../domain/repositories/movie_repository.dart';
import '../domain/usecases/fetch_movie_list.dart';

Future<void> movieInjection() async {
  serviceLocator.registerFactory(() => MoviesBloc(serviceLocator()));

  serviceLocator
      .registerLazySingleton(() => FetchMovieListUseCase(serviceLocator()));

  serviceLocator.registerLazySingleton<MovieListRepository>(() =>
      MovieListRepositoryImpl(fetchMovieListDataSource: serviceLocator()));

  serviceLocator.registerLazySingleton<FetchMovieListDataSource>(
      () => FetchMovieListDataSourceImpl());
}
