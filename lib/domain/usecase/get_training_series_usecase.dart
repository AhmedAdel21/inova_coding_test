import 'package:inova_coding_test/app/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:inova_coding_test/domain/repository/repository.dart';
import 'package:inova_coding_test/domain/usecase/base_usecase.dart';
import 'package:inova_coding_test/presentation/ui/common/ui_models/ui_models.dart';

class GetTrainingSeriesUseCase implements BaseUseCase<void, TrainingSeries> {
  final Repository _repository;

  GetTrainingSeriesUseCase(this._repository);
  @override
  Future<Either<Failure, TrainingSeries>> execute(_) async =>
      _repository.getTrainingSeries();
}
