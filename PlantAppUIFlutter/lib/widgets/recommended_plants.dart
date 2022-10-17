import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'recommended_plant_details.dart';

class RecommendedPlants extends StatelessWidget {
  const RecommendedPlants({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            RecommendedPlantDetails(
              size: size,
              title: 'samantha',
              imageName: 'assets/images/image_1.png',
              country: 'Russia',
              price: 400,
            ),
            SizedBox(
              width: 16,
            ),
            RecommendedPlantDetails(
              size: size,
              title: 'angelica',
              imageName: 'assets/images/image_2.png',
              country: 'Russia',
              price: 540,
            ),
            SizedBox(
              width: 16,
            ),
            RecommendedPlantDetails(
              size: size,
              title: 'samantha',
              imageName: 'assets/images/image_3.png',
              country: 'Russia',
              price: 440,
            ),
          ],
        ),
      ),
    );
  }
}

// RichText(
// text: TextSpan(
// text: 'Address: ',
// style: TextStyle(
// fontWeight: FontWeight.bold, color: Colors.black),
// children: [
// TextSpan(
// text: '23 Test Street, Test City',
// style: TextStyle(
// fontWeight: FontWeight.normal,
// color: Colors.black),
// ),
// ],
// ),
