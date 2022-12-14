import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:gen_test_marvel/features/data/models/mcu_list_model.dart';

import '../../../config/error/failure.dart';

abstract class MovieListRepository {
  Future<Either<Failure, List<McuModel>>> fetchMovielist(BuildContext context);
}
