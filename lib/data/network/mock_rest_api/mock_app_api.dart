import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class MockAppServiceClient {
  static const _jsonDir = 'assets/json/';
  static const _jsonExtension = '.json';

  Future<Response> getTrainingSeries() async {
    final resourcePath = _jsonDir + "seriesData/seriesData" + _jsonExtension;
    final data = await rootBundle.load(resourcePath);
    final map = json.decode(
      utf8.decode(
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      ),
    );
    print(" map : $map");
    return Response(
      requestOptions: RequestOptions(path: resourcePath),
      data: map,
      statusCode: 200,
    );
  }
}
