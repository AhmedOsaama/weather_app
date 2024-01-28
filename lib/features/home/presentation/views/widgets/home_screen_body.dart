import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/core/widgets/loading_indicator.dart';
import 'package:weather_forecast/features/home/presentation/manager/five_day_forecast_provider.dart';
import 'package:weather_forecast/features/home/presentation/views/widgets/five_day_forecast.dart';
import 'package:weather_forecast/features/home/presentation/views/widgets/five_day_graph.dart';
import 'package:weather_forecast/features/home/presentation/views/widgets/legend_view.dart';

import '../../../data/models/WeatherList.dart';

class HomeScreenBody extends StatelessWidget {
  final List<double> maxData = [];
  final List<double> minData = [];
  HomeScreenBody({Key? key}) : super(key: key);
  List<WeatherList> weatherList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
      child: Consumer<FiveDayForecastProvider>(
        builder: (ctx, provider, _) {
          if (provider.weatherList.isEmpty) {
            return const CustomLoadingIndicator();
          }
          populateFiveDayForecast(provider, weatherList);
          return Column(
              children: [
                FiveDayForecast(weatherList: weatherList, getDayName: getDayName, getDate: getDate),
                FiveDayGraph(weatherList: weatherList, minData: minData, maxData: maxData, getDayName: getDayName),
                const LegendWidget(),
              ]
          );
        })
          );
  }

  String getDate(String dtTxt){                             //Formats the date of the timestamp
    return DateFormat("Md").format(DateTime.parse(dtTxt));
  }

  String getDayName(String dtTxt){      //Gets the day of the timestamp e.g. Sunday
    var currentDate = DateTime.now();
    var dateTime = DateTime.parse(dtTxt);
    var difference = dateTime.difference(currentDate);
    if(difference.inDays == 0){
      return "Today";
    }
    if(difference.inDays == 1){
      return "Tomorrow";
    }
    return DateFormat("EEEE").format(dateTime);
  }

  void populateFiveDayForecast(FiveDayForecastProvider provider, List<WeatherList> weatherList) {
    for (var i = 0; i < provider.weatherList.length; i++){
      if(i % 8 == 0){
        weatherList.add(provider.weatherList[i+4]);             //adding timestamps that correspond to the afternoon each day
        populateChartData(provider, i);
      }
    }
  }

  void populateChartData(FiveDayForecastProvider provider, int i) {
      maxData.add(provider.weatherList[i+4].main!.tempMax!.toDouble()); //add max temp data
    minData.add(provider.weatherList[i+4].main!.tempMin!.toDouble()); // add min temp data
  }
}






