import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_test_marvel/features/presenter/bloc/movies_bloc.dart';

import 'config/injection_container.dart';
import 'features/presenter/components/movie_list_display.dart';

class HomeInitialPage extends StatefulWidget {
  const HomeInitialPage({super.key});

  @override
  State<HomeInitialPage> createState() => _HomeInitialPageState();
}

class _HomeInitialPageState extends State<HomeInitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 1)],
              image: DecorationImage(
                  opacity: 0.6,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/home_initial_background.jpeg'))),
          padding: const EdgeInsetsDirectional.all(10),
          child: BlocProvider(
              create: (_) => serviceLocator<MoviesBloc>(),
              child: const MovieListDisplay())),
    );
  }
}
