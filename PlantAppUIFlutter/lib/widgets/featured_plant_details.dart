import 'package:flutter/material.dart';

class FeaturdPlantDetail extends StatelessWidget {
  const FeaturdPlantDetail({
    Key? key,
    required this.imageName,
  }) : super(key: key);

  final String imageName;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(24),
      ),
      child: Container(
        width: size.width * 0.8,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 50,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            ),
          ],
        ),
        child: Image.asset(
          imageName,
          fit: BoxFit.cover,
          height: 180,
        ),
      ),
    );
  }
}
