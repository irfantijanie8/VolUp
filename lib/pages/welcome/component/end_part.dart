import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/home_page.dart';
import 'package:flutter_application_1/pages/login/login_page.dart';
import 'package:flutter_application_1/pages/signup/signup_page.dart';
import 'package:flutter_application_1/route/routing_page.dart';
import 'package:flutter_application_1/widgets/my_button.dart';

class EndPart extends StatelessWidget {
  const EndPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyButton(
          onPressed: (){
            RoutingPage.goTonext(
              context: context,
              navigateTo: LoginPage(),
             );
          }, 
          text: "LOG IN",
        ),
        const SizedBox( // add const
          height: 20,
        ),
        GestureDetector(
          onTap: (){
             RoutingPage.goTonext(
              context: context,
              navigateTo: SignupPage(),
             );
          },
          child: Text(
            "SIGN UP",
            style: TextStyle(color: Color(0xff797b7a)),
          ),
        )
      ],
    );
  }
}