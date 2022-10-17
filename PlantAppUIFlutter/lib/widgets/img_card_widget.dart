import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'properties_button.dart';

class ImageCardWidget extends StatelessWidget {
  const ImageCardWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20 * 2),
                child: Column(
                  children: [
                    Align(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Spacer(),
                    PropertiesButton(
                      imgUrl: 'assets/icons/sun.svg',
                    ),
                    PropertiesButton(
                      imgUrl: 'assets/icons/icon_2.svg',
                    ),
                    PropertiesButton(
                      imgUrl: 'assets/icons/icon_3.svg',
                    ),
                    PropertiesButton(
                      imgUrl: 'assets/icons/icon_4.svg',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: size.width * 0.75,
              height: size.height * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 60,
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.29),
                  ),
                ],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/img.png'),
                    alignment: Alignment.centerLeft),
              ),
              // child: Image.asset(
              //   'assets/images/img_main.png',
              //   fit: BoxFit.contain,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
