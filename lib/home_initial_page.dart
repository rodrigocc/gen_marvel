import 'package:flutter/material.dart';
import 'package:gen_test_marvel/features/data/datasource/fetch_movie_list_datasource.dart';
import 'package:gen_test_marvel/features/data/models/movie_model.dart';

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
        body: FutureBuilder<List<Mcu>>(
            future: movieListDataSourceImpl.fetchMovieList(context),
            builder: (context, movielist) {
              if (movielist.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(movielist.data?[index].title ?? ''),
                    );
                  },
                  itemCount: 10,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.green,
                  ),
                );
              }
            }));
  }
}
