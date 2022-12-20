import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_test_marvel/features/presenter/bloc/movies_bloc.dart';

import '../../data/models/mcu_list_model.dart';

class MovieListDisplay extends StatefulWidget {
  const MovieListDisplay({super.key});

  @override
  State<MovieListDisplay> createState() => _MovieListDisplayState();
}

class _MovieListDisplayState extends State<MovieListDisplay> {
  List<McuModel>? movielist = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MoviesBloc>(context).add(FetchMovieList(
      currentContext: context,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
      if (state is MovieListLoaded) {
        movielist = state.movielist;

        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text(movielist![index].title ?? ''),
            );
          },
          itemCount: movielist!.length,
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.green,
          ),
        );
      }
    });
  }
}
