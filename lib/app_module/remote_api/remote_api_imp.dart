import 'package:dio/dio.dart';

import 'package:zaq_test/app_module/dashboard/models/forecast.dart';
import 'package:zaq_test/app_module/remote_api/remote_api.dart';

class RemoteApiImp implements RemoteApi {
  final Dio dio;

  RemoteApiImp({
    required this.dio,
  });

  @override
  Future<Forecast> getWeather(
      {required String lat,required  String long}) async {
    Response response = await dio.get(
        'latitude=$lat&longitude=$long&hourly=temperature_2m&current_weather=true');
    if (response.statusCode == 200) {
      return Forecast.fromJson(response.data);
    }
    throw response.data;
  }
}