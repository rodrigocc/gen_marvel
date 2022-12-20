import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_test_marvel/features/data/datasource/fetch_movie_list_datasource.dart';
import 'package:gen_test_marvel/features/presenter/bloc/movies_bloc.dart';

import 'config/injection_container.dart';
import 'features/presenter/components/movie_list_display.dart';

class HomeInitialPage extends StatefulWidget {
  const HomeInitialPage({super.key});

  @override
  State<HomeInitialPage> createState() => _HomeInitialPageState();
}

class _HomeInitialPageState extends State<HomeInitialPage> {
  final FetchMovieListDataSourceImpl movieListDataSourceImpl =
      FetchMovieListDataSourceImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (_) => serviceLocator<MoviesBloc>(),
            child: const MovieListDisplay()));
  }
}
