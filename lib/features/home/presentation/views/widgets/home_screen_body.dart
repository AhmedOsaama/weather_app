import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/core/widgets/loading_indicator.dart';
import 'package:weather_forecast/features/home/presentation/manager/five_day_forecast_provider.dart';

import '../../../data/models/WeatherList.dart';

class HomeScreenBody extends StatelessWidget {
  final List<double> chartData = [];
  HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10 ,vertical: 10),
      child: Column(
        children: [
          Expanded(
            child: Consumer<FiveDayForecastProvider>(
              builder: (ctx, provider, _) {
                if(provider.weatherList.isEmpty){
                  return const CustomLoadingIndicator();
                }
                List<WeatherList> weatherList = [];
                populateFiveDayForecast(provider, weatherList);
                return Card(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: weatherList.length,
                  itemBuilder: (context, i) => Container(
                    color: i == 0 ? Colors.blue.withOpacity(0.1) : null,
                    // padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          color: i == 0 ? Colors.indigo : null,
                          child: Column(
                            children: [
                              Text(getDayName(weatherList[i].dtTxt!), style: TextStyle(fontSize: 12, color: i == 0 ? Colors.white : null),),
                              Text(getDate(weatherList[i].dtTxt!), style:
                              TextStyle(fontSize: 12, color: i == 0 ? Colors.white : null),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text("${weatherList[i].main!.tempMax}°", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.red),),
                        SizedBox(height: 5,),
                        Text("${weatherList[i].main!.tempMin}°", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.green),),
                        SizedBox(height: 10,),
                        Text("${weatherList[i].weather!.first.main}",),
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Icon(Icons.water_drop_outlined),
                            Text(weatherList[i].main!.humidity.toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
              ),
                );
              },
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
                        Icon(Icons.stacked_bar_chart, color: Colors.white,),
                        Text("14 day weather", style: TextStyle(color: Colors.white),),
                        Spacer(),
                        InkWell(child: IconButton(onPressed: (){}, icon: Icon(Icons.share, color: Colors.white,))),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Center(
                  child: Sparkline(
                    pointsMode: PointsMode.all,
                      data: chartData
                  ),
                ),
              ],
            ),
          )),
        ]
      ),
    );
  }


  String getDate(String dtTxt){
    return DateFormat("Md").format(DateTime.parse(dtTxt));
  }

  String getDayName(String dtTxt){
    var currentDate = DateTime.now();
    var dateTime = DateTime.parse(dtTxt);
    var difference = dateTime.difference(currentDate);
    if(difference.inDays == 0){
      return "Today";
    }
    if(difference.inDays == 1){
      return "Tomorrow";
    }
    // if(difference.inDays > 1){
      return DateFormat("EEEE").format(dateTime);
    // }
    // return ;
  }

  void populateFiveDayForecast(FiveDayForecastProvider provider, List<WeatherList> weatherList) {
    for (var i = 0; i < provider.weatherList.length; i++){
      if(i % 8 == 0){
        weatherList.add(provider.weatherList[i+4]);             //adding timestamps that correspond to the afternoon each day
        chartData.add(provider.weatherList[i+4].main!.tempMax!.toDouble());
      }
        // chartData.add(ChartData(i, provider.weatherList[i].main?.tempMax ?? 0));
    }
  }

}

