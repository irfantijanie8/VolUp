import 'package:flutter/material.dart';

class TopPart extends StatelessWidget {
  const TopPart({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Row(

              // top part
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "images/logo.png",
                        scale: 2.5,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            );
  }
}