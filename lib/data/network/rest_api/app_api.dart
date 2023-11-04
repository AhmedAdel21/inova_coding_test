import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:inova_coding_test/app/constants/global_constants.dart';
import 'package:inova_coding_test/data/response/responses.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
}
