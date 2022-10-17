import 'package:flutter/material.dart';
import 'package:plant_app_flutter_ui/widgets/body_plants_details_screen.dart';

class PlantsDetailsScreen extends StatelessWidget {
  const PlantsDetailsScreen({Key? key}) : super(key: key);

  static String id = '/PlantsDetailsScreen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Body(size: size),
    );
  }
}
