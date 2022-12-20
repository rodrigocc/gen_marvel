import 'package:flutter/material.dart';

import 'marvel_app.dart';

import 'config/injection_container.dart' as di;

void main() {
  runApp(const MarvelApp());

  di.init();
}
