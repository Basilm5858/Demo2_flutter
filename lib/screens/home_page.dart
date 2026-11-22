import 'package:demo2/providers/weather_provider.dart';
import 'package:demo2/widgets/custom_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 89, 0),
        centerTitle: true,
        title: Text("Weather App", style: TextStyle(color: Colors.white)),
      ),
      body: Consumer<WeatherProvider>(
        builder: (context, value, child) {
          final data = value.country?.countries;
          if (data == null) {
            value.getweather();
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemBuilder: (context, index) => CustomList(model: data[index]),
              itemCount: data.length,
            );
          }
        },
      ),
    );
  }
}
