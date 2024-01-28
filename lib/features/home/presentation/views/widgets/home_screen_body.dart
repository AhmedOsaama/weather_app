import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/core/widgets/loading_indicator.dart';
import 'package:weather_forecast/features/home/presentation/manager/five_day_forecast_provider.dart';

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
                Expanded(
                  child: Card(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: weatherList.length,
                      itemBuilder: (context, i) =>
                          Container(
                            color: i == 0 ? Colors.blue.withOpacity(0.1) : null,
                            child: Column(
                              children: [
                                Container(
                                  width: 100,
                                  color: i == 0 ? Colors.indigo : null,
                                  child: Column(
                                    children: [
                                      Text(getDayName(weatherList[i].dtTxt!),
                                        style: TextStyle(fontSize: 12, color: i == 0 ? Colors.white : null),),
                                      Text(getDate(weatherList[i].dtTxt!), style:
                                      TextStyle(fontSize: 12, color: i == 0 ? Colors.white : null),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                Text("${weatherList[i].main!.tempMax}°", style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600, color: Colors.red),),
                                const SizedBox(height: 5,),
                                Text("${weatherList[i].main!.tempMin}°", style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600, color: Colors.green),),
                                const SizedBox(height: 10,),
                                Text("${weatherList[i].weather!.first.main}",),
                                const SizedBox(height: 15,),
                                Row(
                                  children: [
                                    const Icon(Icons.water_drop_outlined),
                                    Text(weatherList[i].main!.humidity.toString()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                    ),
                  ),
                ),
                Expanded(child: Card(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              const Icon(Icons.stacked_bar_chart, color: Colors.white,),
                              const SizedBox(width: 10,),
                              const Text("14 day weather", style: TextStyle(color: Colors.white),),
                              const Spacer(),
                              IconButton(onPressed: () {}, icon: const Icon(Icons.share, color: Colors.white,)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: weatherList.map((e) => Text(getDayName(e.dtTxt!))).toList(),
                      ),
                      Sparkline(
                        pointsMode: PointsMode.all,
                          lineColor: Colors.red,
                          data: maxData
                      ),
                      const SizedBox(height: 10,),
                      Sparkline(
                        pointsMode: PointsMode.all,
                          data: minData
                      )
                    ],
                  ),
                )),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                        shape: BoxShape.circle
                      ),
                      child: Container(),
                    ),
                    const SizedBox(width: 10,),
                    const Text("Max (°C)"),
                    const SizedBox(width: 20,),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                        shape: BoxShape.circle
                      ),
                    ),
                    const SizedBox(width: 10,),
                    const Text("Min (°C)"),
                  ],
                )
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





