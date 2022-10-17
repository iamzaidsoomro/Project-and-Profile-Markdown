import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app_flutter_ui/widgets/title_price.dart';

import 'img_card_widget.dart';
import 'properties_button.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageCardWidget(size: size),
          TitleAndPrice(),
          Row(
            children: [
              BottomButtonPlantDetailScreen(
                text: 'Buy Now',
                size: size,
                buttonColor: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.secondary,
              ),
              BottomButtonPlantDetailScreen(
                text: 'Description',
                size: size,
                buttonColor: Theme.of(context).colorScheme.secondary,
                textColor: Colors.black,
              ),
              // TextButton(
              //   onPressed: () {},
              //   child: Text(
              //     'Buy Now',
              //     style:
              //         TextStyle(color: Theme.of(context).colorScheme.secondary),
              //   ),
              //   style: ButtonStyle(
              //     s
              //     backgroundColor: MaterialStateProperty.all(
              //         Theme.of(context).colorScheme.primary),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomButtonPlantDetailScreen extends StatelessWidget {
  const BottomButtonPlantDetailScreen(
      {Key? key,
      required this.size,
      required this.buttonColor,
      required this.textColor,
      required this.text})
      : super(key: key);

  final Size size;
  final buttonColor;
  final textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width / 2,
      height: size.height * 0.09,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
        ),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
