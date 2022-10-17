import 'package:flutter/material.dart';
import 'package:plant_app_flutter_ui/screens/plants_details_screen.dart';

class RecommendedPlantDetails extends StatelessWidget {
  const RecommendedPlantDetails({
    Key? key,
    required this.size,
    required this.title,
    required this.price,
    required this.country,
    required this.imageName,
  }) : super(key: key);

  final Size size;
  final String title;
  final String imageName;
  final String country;
  final int price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PlantsDetailsScreen.id);
      },
      child: SizedBox(
        width: size.width * 0.4,
        child: Column(
          children: [
            Image.asset(
              imageName,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title.toUpperCase(),
                          style: Theme.of(context).textTheme.button),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        country.toUpperCase(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
