import 'package:zaq_test/app_module/dashboard/models/forecast.dart';

abstract class RemoteApi {
  Future<Forecast> getWeather({required String lat,required  String long});
}

//