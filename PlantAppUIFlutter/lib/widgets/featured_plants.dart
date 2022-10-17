import 'package:flutter/material.dart';

import 'featured_plant_details.dart';

class FeatruedPalnts extends StatelessWidget {
  const FeatruedPalnts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            FeaturdPlantDetail(
              imageName: 'assets/images/bottom_img_1.png',
            ),
            SizedBox(
              width: 16,
            ),
            FeaturdPlantDetail(
              imageName: 'assets/images/bottom_img_2.png',
            ),
          ],
        ),
      ),
    );
  }
}
