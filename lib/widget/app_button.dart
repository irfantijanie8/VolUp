import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/navpages/donations.dart';
import 'package:flutter_application_1/pages/navpages/volunteer_list.dart';

import '../misc/colors.dart';
import '../pages/NearEvents/navigation_screen.dart';
import 'app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  String eventId;
  bool? isIcon;

  AppButtons(
      {Key? key,
      this.isIcon = false,
      this.text = "Hi",
      this.icon,
      required this.size,
      required this.color,
      required this.backgroundColor,
      required this.borderColor,
      required this.eventId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => volList()));
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
        ),
        child: isIcon == false
            ? Center(child: AppText(text: text!, color: color))
            : Center(child: Icon(icon, color: color)),
      ),
    );
  }
}
