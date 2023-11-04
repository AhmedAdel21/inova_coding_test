import 'package:inova_coding_test/data/network/mock_rest_api/mock_app_api.dart';
import 'package:inova_coding_test/data/network/rest_api/app_api.dart';
import 'package:inova_coding_test/data/response/responses.dart';
import 'package:inova_coding_test/presentation/ui/common/ui_models/ui_models.dart';

abstract class RemoteDataSource {
  Future<TrainingSeriesResponse> getTrainingSeries();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  final MockAppServiceClient _mockAppServiceClient = MockAppServiceClient();
  static const bool _useMockData = true;
  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<TrainingSeriesResponse> getTrainingSeries() async {
    // if (_useMockData) {
    final seriesResponse = await _mockAppServiceClient.getTrainingSeries();
    final response = TrainingSeriesResponse.fromJson(seriesResponse.data);
    print(response.toJson());
    return response;
    // }
    // return _appServiceClient.getTrainingSeries();
  }
}
