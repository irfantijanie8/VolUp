import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/NearEvents/all_near_events.dart';
import 'package:flutter_application_1/pages/home/home_page.dart';
import 'package:flutter_application_1/pages/login/login_page.dart';
import 'package:flutter_application_1/route/routing_page.dart';

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
            accountName: Text("Lindel"),
            accountEmail: Text("lindel795@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/default_profile.jpg"),
            ),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                RoutingPage.goTonext(
                  context: context,
                  navigateTo: HomePage(),
                );
              },
              icon: Icon(
                Icons.home,
              ),
            ),
            title: Text("Home"),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
              ),
            ),
            title: Text("Profile"),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.money,
              ),
            ),
            title: Text("Donation"),
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
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.history,
              ),
            ),
            title: Text("My History"),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then(
                      (value) => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      ),
                    );
              },
              icon: Icon(
                Icons.exit_to_app,
              ),
            ),
            title: Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
