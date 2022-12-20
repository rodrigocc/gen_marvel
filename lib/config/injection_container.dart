import 'package:get_it/get_it.dart';

import '../features/di/movielist_injection.dart';

final serviceLocator = GetIt.I;

Future<void> init() async {
  await movieInjection();
}
