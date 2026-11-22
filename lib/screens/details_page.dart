import 'package:demo2/models/weather_model.dart';
import 'package:demo2/widgets/custom_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsPage extends StatelessWidget {
  final WeatherModel model;

  const new({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 89, 0),
        centerTitle: true,
        title: Text(model.name, style: TextStyle(color: Colors.white)),
      ),
      body: CustomDetails(model: model),
    );
  }
}
