import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/features/home/presentation/manager/five_day_forecast_provider.dart';

import 'widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var cityName = "";

  @override
  void initState() {
    super.initState();
    Provider.of<FiveDayForecastProvider>(context, listen: false).fetchFiveDayForecast().then((_) {
      setState(() {
        cityName = Provider.of<FiveDayForecastProvider>(context, listen: false).cityName;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){}, icon: Icon(Icons),),
        title: Text(cityName),
        centerTitle: true,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.share))],
      ),
      drawer: Drawer(),
      body: HomeScreenBody(),
    );
  }
}
