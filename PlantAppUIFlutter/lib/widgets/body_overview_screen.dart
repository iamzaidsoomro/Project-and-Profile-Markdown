import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app_flutter_ui/widgets/featured_plants.dart';
import 'package:plant_app_flutter_ui/widgets/recommended_plants.dart';

import 'header_with_searchbox.dart';
import 'title_with_morebtn.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        HeaderWithSearchBox(size: size),
        const TitleWithButton(
          title: 'Recommended',
        ),
        RecommendedPlants(
          size: size,
        ),
        const TitleWithButton(
          title: 'Featured Plants',
        ),
        FeatruedPalnts(),
      ],
    ));
  }
}
