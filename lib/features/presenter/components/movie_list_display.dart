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

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'MARVEL CINEMATIC UNIVERSE',
                  maxLines: 3,
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'LINHA DO TEMPO',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            Expanded(
              flex: 1,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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
                                movielist![index].posterPath ?? ''),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        movielist![index].title ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        softWrap: true,
                      ),
                      Text(
                        "(${DateTime.parse(movielist![index].releaseDate ?? '').year.toString()})",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      !movielist![index].title!.contains('\n')
                          ? const SizedBox(
                              height: 17,
                            )
                          : const SizedBox.shrink()
                    ],
                  );
                },
                itemCount: movielist!.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
              ),
            ),
          ],
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
