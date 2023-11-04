import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:inova_coding_test/data/network/rest_api/app_api.dart';
import 'package:inova_coding_test/data/requests.dart';
import 'package:inova_coding_test/data/response/responses.dart';

@GenerateMocks([AppServiceClient])
import 'app_api_test.mocks.dart';

void main() {
  group("#fetchData", () {});
}

final json = {
  "status": 0,
  "message": "Succuss",
  "userId": 1,
  "userName": "Dola",
  "password": "123"
};
