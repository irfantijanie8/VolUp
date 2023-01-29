import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/build_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BuildDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 132, 18, 238),
      ),
      body: Center(
        child: Text("HomePage"),
      ),
    );
  }
}