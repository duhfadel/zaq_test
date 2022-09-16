import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaq_test/app_module/add_city/cubit/add_city_cubit.dart';
import 'package:zaq_test/app_module/add_city/pages/add_city.dart';
import 'package:zaq_test/app_module/dashboard/cubit/dashboard_cubit.dart';

class AddCityProvider extends StatelessWidget {
  AddCityProvider(this.dashboardCubit);
  DashboardCubit dashboardCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCityCubit(dashboardCubit),
      child: AddCityView(),
    );
  }
}
