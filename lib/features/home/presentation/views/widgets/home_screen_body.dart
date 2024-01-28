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

  // LineChartData get sampleData1 => LineChartData(
  //   // lineTouchData: lineTouchData1,
  //   gridData: gridData,
  //   titlesData: titlesData1,
  //   borderData: borderData,
  //   lineBarsData: lineBarsData1,
  //   minX: 1,
  //   maxX: 5,
  //   maxY: 200,
  //   minY: 0,
  // );
  // List<LineChartBarData> get lineBarsData1 => [
  //   lineChartBarData1_1,
  // ];
  //
  // FlBorderData get borderData => FlBorderData(
  //   show: false,
  //   // border: Border(
  //   //   bottom:
  //   //   BorderSide(color: AppColors.primary.withOpacity(0.2), width: 4),
  //   //   left: const BorderSide(color: Colors.transparent),
  //   //   right: const BorderSide(color: Colors.transparent),
  //   //   top: const BorderSide(color: Colors.transparent),
  //   // ),
  // );
  //
  // FlGridData get gridData => FlGridData(show: false);
  //
  // FlTitlesData get titlesData1 => FlTitlesData(
  //   bottomTitles: AxisTitles(
  //     sideTitles: SideTitles(showTitles: false),
  //   ),
  //   rightTitles: AxisTitles(
  //     sideTitles: SideTitles(showTitles: false),
  //   ),
  //   topTitles: AxisTitles(
  //     sideTitles: SideTitles(showTitles: true),
  //   ),
  //   leftTitles: AxisTitles(
  //     sideTitles: SideTitles(showTitles: false),
  //   ),
  // );
  //
  // LineChartBarData get lineChartBarData1_1 => LineChartBarData(
  //   isCurved: false,
  //   color: Colors.green,
  //   // barWidth: 8,
  //   isStrokeCapRound: true,
  //   dotData: FlDotData(show: true),
  //   spots: const [
  //     FlSpot(1, 78),
  //     FlSpot(2, 89),
  //     FlSpot(3, 45),
  //     FlSpot(4, 22),
  //     FlSpot(5,66),
  //   ],
  // );
  //
  //
  // List<FlSpot> spotsList = [];

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
                            // padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                SizedBox(height: 15,),
                                Text("${weatherList[i].main!.tempMax}°", style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600, color: Colors.red),),
                                SizedBox(height: 5,),
                                Text("${weatherList[i].main!.tempMin}°", style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600, color: Colors.green),),
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
                              SizedBox(width: 10,),
                              const Text("14 day weather", style: TextStyle(color: Colors.white),),
                              const Spacer(),
                              InkWell(
                                  child: IconButton(onPressed: () {}, icon: Icon(Icons.share, color: Colors.white,))),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: weatherList.map((e) => Text(getDayName(e.dtTxt!))).toList(),
                      ),
                      const SizedBox(height: 50,),
                      Sparkline(
                        pointsMode: PointsMode.all,
                          lineColor: Colors.red,
                          data: maxData
                      ),
                      SizedBox(height: 10,),
                      Sparkline(
                        pointsMode: PointsMode.all,
                          data: minData
                      )
                    ],
                  ),
                )),
              ]
          );
        })
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
        maxData.add(provider.weatherList[i+4].main!.tempMax!.toDouble());
        minData.add(provider.weatherList[i+4].main!.tempMin!.toDouble());
      }
      // chartData.add(ChartData(i, provider.weatherList[i].main?.tempMax ?? 0));
    }
  }
}





