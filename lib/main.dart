import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/core/service_locator.dart';
import 'package:weather_forecast/features/home/data/repos/home_repo_impl.dart';
import 'package:weather_forecast/features/home/presentation/manager/five_day_forecast_provider.dart';
import 'package:weather_forecast/features/home/presentation/manager/location_provider.dart';
import 'package:weather_forecast/features/home/presentation/views/home_view.dart';

void main() {
  setupServiceLocator();
  runApp(
      MultiProvider(
        providers: [
          // ChangeNotifierProvider<LocationProvider>(create: (_) => LocationProvider()),
          ChangeNotifierProvider<FiveDayForecastProvider>(create: (_) => FiveDayForecastProvider(
            getIt.get<HomeRepoImpl>(),
          )),
        ],
  child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}