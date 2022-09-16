import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaq_test/app_module/dashboard/cubit/dashboard_state.dart';
import 'package:zaq_test/app_module/dashboard/models/city.dart';
import 'package:zaq_test/app_module/dashboard/models/forecast.dart';
import 'package:zaq_test/app_module/database/database.dart';
import 'package:zaq_test/app_module/remote_api/remote_api.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({required this.remoteApi}) : super(DashboardState()) {
    updateList();
  }

  RemoteApi remoteApi;
  SavingDatabase savingDatabase = SavingDatabase();

  List<City> cityList = [];
  Forecast? forecast;

  void updateList() async {
    cityList = await savingDatabase.findAll();
    emit(DashboardState(cityList: cityList));
  }

  Future<Forecast?> fetchDatabyLatLong(String lat, String long) async {
    try {
     Forecast forecast = await remoteApi.getWeather(lat: lat, long: long);
     return forecast;
    } catch (e) {
      print(e);
    }
  }
}
