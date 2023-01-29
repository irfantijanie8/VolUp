import 'package:flutter/material.dart';

class TopPart extends StatelessWidget {
  const TopPart ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: const [  // add const 
            Text(
              "Welcome to VolUp",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Explore Us",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ],
    );
  }
}