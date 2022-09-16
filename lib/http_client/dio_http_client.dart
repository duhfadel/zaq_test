import 'package:dio/dio.dart';

class DioHttpClient {
  final Dio dio = Dio();

  DioHttpClient() {
    _setupDio();
  }

  String base =
      'https://api.open-meteo.com/v1/forecast?';

  void _setupDio() {
    dio.options.baseUrl = base;
    dio.options.connectTimeout = const Duration(seconds: 30).inMilliseconds;
  }
}
