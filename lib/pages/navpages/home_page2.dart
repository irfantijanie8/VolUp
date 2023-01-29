import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/build_drawer.dart';

import '../../misc/colors.dart';
import 'home_page2_details.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    // getData();
    //print("testing============\n\n\n");
    //print(event_play[0]);

    return Scaffold(
      drawer: BuildDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 132, 18, 238),
        title: Text("Volunteer Events"),
      ),
      body: Body(),
      //body:AllNearEvents(),
    );
  }
}
