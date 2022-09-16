import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaq_test/app_module/dashboard/cubit/dashboard_cubit.dart';
import 'package:zaq_test/app_module/dashboard/pages/dashboard.dart';
import 'package:zaq_test/app_module/remote_api/remote_api.dart';

class DashboardProvider extends StatelessWidget {
  const DashboardProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (context) => DashboardCubit(remoteApi: context.read<RemoteApi>()),
      child:  DashboardView(),
    );
  }
}