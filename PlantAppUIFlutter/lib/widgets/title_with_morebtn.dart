import 'package:flutter/material.dart';

class TitleWithButton extends StatelessWidget {
  const TitleWithButton({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.8),
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'More',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(24, 28),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
