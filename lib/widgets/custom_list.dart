import 'package:demo2/models/weather_model.dart';
import 'package:demo2/screens/details_page.dart';
import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  final WeatherModel model;

  const CustomList({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsPage(model: model)),
        );
      },
      child: Card(
        elevation: 4,
        child: ListTile(
          leading: Image.network(
            model.countryImageUrl,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.broken_image),
          ),
          title: Text(
            model.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Text(
            "${model.tempreature}C",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
