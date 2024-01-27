import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/core/service_locator.dart';
import 'package:weather_forecast/core/widgets/loading_indicator.dart';
import 'package:weather_forecast/features/home/data/repos/home_repo_impl.dart';
import 'package:weather_forecast/features/home/presentation/manager/five_day_forecast_provider.dart';
import 'package:weather_forecast/features/home/presentation/manager/location_provider.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {


  @override
  void initState(){
    super.initState();
    Provider.of<FiveDayForecastProvider>(context,listen: false).fetchFiveDayForecast();
    // var locationProvider = Provider.of<LocationProvider>(context, listen: false);
    // locationProvider.requestLocation().then((value) {
    //   Provider.of<FiveDayForecastProvider>(context).fetchFiveDayForecast(locationProvider.lat.toString(), locationProvider.long.toString(), "metric");
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text("lat: ${locationProvider.lat}, long: ${locationProvider.long}"),
        Consumer<FiveDayForecastProvider>(
          builder: (ctx, provider, _) {
            if(provider.weatherList.isEmpty){
              return const CustomLoadingIndicator();
            }
            return Expanded(
            child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.weatherList.length,
              itemBuilder: (context, i) => Column(
                children: [
                  Text(provider.weatherList[i].dtTxt!),
                  Text(provider.weatherList[i].main!.temp.toString()),
                  Text(provider.weatherList[i].main!.humidity.toString()),
                ],
              ),
          ),);
          },
        )
      ]
    );
  }
}
