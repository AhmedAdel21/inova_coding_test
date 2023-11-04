import 'package:dartz/dartz.dart';
import 'package:inova_coding_test/app/error/failure.dart';
import 'package:inova_coding_test/presentation/ui/common/ui_models/ui_models.dart';

abstract class Repository {
  Future<void> initRepo();
  Future<Either<Failure, TrainingSeries>> getTrainingSeries();
}
