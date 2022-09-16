import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaq_test/app_module/add_city/cubit/add_city_state.dart';
import 'package:zaq_test/app_module/dashboard/cubit/dashboard_cubit.dart';
import 'package:zaq_test/app_module/dashboard/models/city.dart';
import 'package:zaq_test/app_module/database/database.dart';

class AddCityCubit extends Cubit<AddCityState> {
  AddCityCubit(this.dashboardCubit) : super(AddCityState(isReady: false));
  SavingDatabase savingDatabase = SavingDatabase();
  DashboardCubit dashboardCubit;

  void setCity(String value) {
    emit(state.copyWith(cityName: value));
    _calcIsReady();
  }

  void setCode(String value) {
    emit(state.copyWith(cityCode: value));
    _calcIsReady();
  }

  void setLang(String value) {
    emit(state.copyWith(cityLanguage: value));
    _calcIsReady();
  }

  void setLatitude(String value) {
    emit(state.copyWith(cityLat: value));
    _calcIsReady();
  }

  void setLongitude(String value) {
    emit(state.copyWith(cityLong: value));
    _calcIsReady();
  }

  void _calcIsReady() {
    bool isReady = state.cityName != null &&
        state.cityName!.isNotEmpty &&
        state.cityCode != null &&
        state.cityCode!.isNotEmpty &&
        state.cityLanguage != null &&
        state.cityLanguage!.isNotEmpty &&
        state.cityLat != null &&
        state.cityLat!.isNotEmpty &&
        state.cityLong != null &&
        state.cityLong!.isNotEmpty;
    emit(state.copyWith(isReady: isReady));
  }

  void saveList() {
    City city = City(
        name: state.cityName!,
        countryCode: state.cityCode!,
        language: state.cityLanguage!,
        latitude: state.cityLat!,
        longitude: state.cityLong!);
    savingDatabase.saveDatabase(city);
  }

  void updateList(){
    dashboardCubit.updateList();
  }
}
