import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/welcome/component/center_part.dart';
import 'package:flutter_application_1/pages/welcome/component/top_part.dart';

import 'component/end_part.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TopPart(),


              // Center part

              CenterPart(),

              // End Part

              EndPart(),
              
            ],
          ),
        ),
      ),
    );
  }
}