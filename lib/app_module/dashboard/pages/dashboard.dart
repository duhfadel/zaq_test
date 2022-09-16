import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaq_test/app_module/add_city/pages/add_city_provider.dart';
import 'package:zaq_test/app_module/dashboard/cubit/dashboard_cubit.dart';
import 'package:zaq_test/app_module/dashboard/cubit/dashboard_state.dart';
import 'package:zaq_test/app_module/dashboard/models/city.dart';
import 'package:zaq_test/app_module/func_module/animation.dart';

import '../models/forecast.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});
  Animations animations = Animations();

  @override
  Widget build(BuildContext context) {
    DashboardCubit dashboardCubit = context.read<DashboardCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Cities'),
        centerTitle: true,
      ),
      body: BlocBuilder<DashboardCubit, DashboardState>(
        bloc: dashboardCubit,
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.cityList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        Forecast? forecast =
                            await dashboardCubit.fetchDatabyLatLong(
                                state.cityList![index].latitude,
                                state.cityList![index].longitude);
                        if (forecast != null) {
                          showPopup(context, forecast);
                        } else {
                          showPopupError(context);
                        }
                      },
                      child: Card(
                        elevation: 10,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_city_outlined,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Text('City Name: '),
                                  Text(
                                    state.cityList![index].name,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.language),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Text('Language: '),
                                  Text(
                                    state.cityList![index].language,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.phone),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Text('Country Code: '),
                                  Text(
                                    state.cityList![index].countryCode,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.location_on_outlined),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Text(
                                    'Latitude: ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    state.cityList![index].latitude,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const Text(
                                    'Longitude: ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    state.cityList![index].longitude,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 1,
                      color: Colors.grey,
                      width: double.maxFinite,
                      margin: const EdgeInsets.all(4),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      animations.createFirstRoute(dashboardCubit),
                    );
                  },
                  child: const Text('Add City'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  showPopup(context, Forecast forecast) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)),
                ),
                const Text('Weather Forecast'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Text('Temperatures in ªC: '),
                    Text('${forecast.currentWeather!.temperature!}')
                  ],
                )
              ],
            ),
          );
        });
  }

  showPopupError(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)),
                ),
                const Text('Weather Forecast'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Text('Please double check latitude and longitude')
                  ],
                )
              ],
            ),
          );
        });
  }
}
