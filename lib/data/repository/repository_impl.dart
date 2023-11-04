import 'package:inova_coding_test/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:inova_coding_test/data/network/network_info.dart';
import 'package:inova_coding_test/app/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:inova_coding_test/data/response/responses.dart';
import 'package:inova_coding_test/domain/repository/repository.dart';
import 'package:inova_coding_test/presentation/ui/common/ui_models/ui_models.dart';
import 'package:inova_coding_test/data/mapper/mapper.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<void> initRepo() async {}

  @override
  Future<Either<Failure, TrainingSeries>> getTrainingSeries() async {
    // try {
      TrainingSeriesResponse series =
          await _remoteDataSource.getTrainingSeries();

      return Right(series.toDomain);
    // } catch (e) {
    //   return Left(Failure(
    //       RepositoryErrorCodesConstant.localDataSourceErrorCode, e.toString()));
    // }
  }
}

class RepositoryErrorCodesConstant {
  static const localDataSourceErrorCode = 5000;
}
