import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Create%20Event/create_event.dart';
import 'package:flutter_application_1/pages/NearEvents/all_near_events.dart';
import 'package:flutter_application_1/pages/history/createHistory.dart';
import 'package:flutter_application_1/pages/history/joinHistory.dart';
import 'package:flutter_application_1/pages/home/home_page.dart';
import 'package:flutter_application_1/pages/login/login_page.dart';
import 'package:flutter_application_1/pages/navpages/home_page2.dart';
import 'package:flutter_application_1/route/routing_page.dart';

import 'package:flutter_application_1/Profile/profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 139, 50, 240),
                Color.fromARGB(255, 132, 18, 238)
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            ),
            accountName: nameData(
              key: key,
            ),
            accountEmail: emailData(key: key),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/default_profile.jpg"),
            ),
          ),
          ListTile(
            onTap: () {
              RoutingPage.goTonext(
                context: context,
                navigateTo: HomePage2(),
              );
            },
            leading: Icon(
              Icons.home,
            ),
            title: Text("Home"),
          ),
          ListTile(
            onTap: () {
              RoutingPage.goTonext(
                context: context,
                navigateTo: profilePage(),
              );
            },
            leading: Icon(
              Icons.person,
            ),
            title: Text("Profile"),
          ),
          ListTile(
            onTap: () {
              RoutingPage.goTonext(
                context: context,
                navigateTo: AllNearEvents(),
              );
            },
            leading: Icon(
              Icons.event_available_rounded,
            ),
            title: Text("Nearby Events"),
          ),
          ListTile(
            onTap: () {
              RoutingPage.goTonext(
                context: context,
                navigateTo: createHistory(),
              );
            },
            leading: Icon(
              Icons.create,
            ),
            title: Text("Created History"),
          ),
          ListTile(
            onTap: () {
              RoutingPage.goTonext(
                context: context,
                navigateTo: joinHistory(),
              );
            },
            leading: Icon(
              Icons.create,
            ),
            title: Text("My History"),
          ),
          ListTile(
            onTap: () {
              RoutingPage.goTonext(
                context: context,
                navigateTo: createEvent(),
              );
            },
            leading: Icon(
              Icons.create,
            ),
            title: Text("Create Events"),
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut().then(
                    (value) => Navigator.of(context)
                        .popUntil((route) => route.isFirst),
                  );
            },
            leading: Icon(
              Icons.exit_to_app,
            ),
            title: Text("Log Out"),
          ),
        ],
      ),
    );
  }
}

class nameData extends StatefulWidget {
  const nameData({super.key});

  @override
  State<nameData> createState() => _nameDataState();
}

class _nameDataState extends State<nameData> {
  String? name = '';

  Future _getDataFromDatabase() async {
    print(FirebaseAuth.instance.currentUser!.uid);
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!['fullName'];
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Text(name!);
  }
}

class emailData extends StatefulWidget {
  const emailData({super.key});

  @override
  State<emailData> createState() => _emailDataState();
}

class _emailDataState extends State<emailData> {
  String? email = '';

  Future _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          email = snapshot.data()!['emailAdress'];
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Text(email!);
  }
}
