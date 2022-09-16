import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaq_test/app_module/dashboard/pages/dashboard_provider.dart';
import 'package:zaq_test/app_module/remote_api/remote_api.dart';
import 'package:zaq_test/app_module/remote_api/remote_api_imp.dart';
import 'package:zaq_test/http_client/dio_http_client.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<DioHttpClient>(
      create: (context) => DioHttpClient(),
      child: RepositoryProvider<RemoteApi>(
        create: (context) =>
            RemoteApiImp(dio: context.read<DioHttpClient>().dio),
        child: MaterialApp(
          home:  AnimatedSplashScreen(
            backgroundColor: Colors.black,
          splash: Image.asset('assets/flutterlogo.png'),
          nextScreen: const DashboardProvider(),
          splashTransition: SplashTransition.rotationTransition,
          duration: 3000
          ),
          )
        ),
      
    );
  }
}