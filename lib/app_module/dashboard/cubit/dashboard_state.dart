import 'package:zaq_test/app_module/dashboard/models/city.dart';
import 'package:zaq_test/app_module/dashboard/models/forecast.dart';

class DashboardState {
  List<City>? cityList;
  Forecast? forecast;
  DashboardState({
    this.cityList,
    this.forecast
  });
}
