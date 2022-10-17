import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app_flutter_ui/widgets/body_overview_screen.dart';

class PlantsOverViewScreen extends StatelessWidget {
  PlantsOverViewScreen({Key? key}) : super(key: key);

  //var String assetName = 'assets/image.svg';
  final Widget svg =
      SvgPicture.asset('assets/icons/flower.svg', semanticsLabel: 'Acme Logo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/flower.svg'),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/heart-icon.svg'),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/user-icon.svg'),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -10),
              blurRadius: 35,
              //spreadRadius: 5,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.38),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          //    alignment: Alignment.bottomRight,
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/menu.svg',
          ),
        ),
      ),
      body: const Body(),
    );
  }
}
