import 'package:gen_test_marvel/config/local_client.dart';
import 'package:get_it/get_it.dart';

import '../features/di/movielist_injection.dart';

final serviceLocator = GetIt.I;

Future<void> init() async {
  await movieInjection();

  serviceLocator
      .registerLazySingleton<ILocalClient>(() => LocalCLientServiceImpl());
}
