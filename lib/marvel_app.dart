import 'package:flutter/material.dart';

import 'features/presenter/pages/home_initial_page.dart';

class MarvelApp extends StatelessWidget {
  const MarvelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gen Marvel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeInitialPage(),
    );
  }
}
