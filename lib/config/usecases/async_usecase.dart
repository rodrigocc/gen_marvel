import 'package:dartz/dartz.dart';
import 'package:gen_test_marvel/config/error/failure.dart';

abstract class AsyncListUseCase<Type, Params> {
  Future<Either<Failure, List<Type>>> call(Params params);
}
