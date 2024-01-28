import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/features/home/data/models/WeatherList.dart';

class FiveDayGraph extends StatelessWidget {
  final List<WeatherList> weatherList;
  final List<double> minData;
  final List<double> maxData;
  final Function getDayName;
  const FiveDayGraph({Key? key, required this.weatherList, required this.minData, required this.maxData, required this.getDayName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Card(
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
    ));
  }
}
