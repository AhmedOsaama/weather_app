import 'package:flutter/material.dart';

import '../../../data/models/WeatherList.dart';

class FiveDayForecast extends StatelessWidget {
  final List<WeatherList> weatherList;
  final Function getDayName;
  final Function getDate;
  const FiveDayForecast({Key? key, required this.weatherList, required this.getDayName, required this.getDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
