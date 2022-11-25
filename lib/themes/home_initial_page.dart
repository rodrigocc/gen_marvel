import 'package:flutter/material.dart';
import 'package:gen_test_marvel/features/data/datasource/fetch_movie_list_datasource.dart';

class HomeInitialPage extends StatefulWidget {
  const HomeInitialPage({super.key});

  @override
  State<HomeInitialPage> createState() => _HomeInitialPageState();
}

class _HomeInitialPageState extends State<HomeInitialPage> {
  final FetchMovieListDataSourceImpl fetchMovieListDataSourceImpl =
      FetchMovieListDataSourceImpl();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        var testReturn = fetchMovieListDataSourceImpl.fetchMovieList();

        print(testReturn);
      }),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),

        // child: GestureDetector(
        //   onTap: (() {
        //     var testReturn = fetchMovieListDataSourceImpl.fetchMovieList();

        //     print(testReturn);
        //   }),
      ),
    );
  }
}
