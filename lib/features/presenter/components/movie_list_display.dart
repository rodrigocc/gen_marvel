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

        return ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    height: 300,
                    width: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            alignment: Alignment.centerLeft,
                            image: NetworkImage(
                                movielist![index].posterPath ?? '')))),
                const SizedBox(
                  height: 10,
                ),
                Text(movielist![index].title ?? ''),
              ],
            );
          },
          itemCount: movielist!.length,
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
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
