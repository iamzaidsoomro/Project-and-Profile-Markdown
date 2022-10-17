import 'package:flutter/material.dart';
import 'package:plant_app_flutter_ui/screens/plants_details_screen.dart';
import 'package:plant_app_flutter_ui/screens/plants_overview_screen.dart';

void main() {
  runApp(const PlantApp());
}

class PlantApp extends StatelessWidget {
  const PlantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green, accentColor: Colors.white),
      ),
      home: PlantsOverViewScreen(),
      routes: {
        PlantsDetailsScreen.id: (context) => PlantsDetailsScreen(),
      },
    );
  }
}
