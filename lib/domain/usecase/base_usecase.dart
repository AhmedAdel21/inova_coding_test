import 'package:dartz/dartz.dart';
import 'package:inova_coding_test/app/error/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
