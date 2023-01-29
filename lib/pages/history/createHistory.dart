import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dart:io';

import 'package:flutter_application_1/pages/navpages/home_page2.dart';
import 'package:flutter_application_1/route/routing_page.dart';

class createHistory extends StatefulWidget {
  const createHistory({super.key});

  @override
  State<createHistory> createState() => _createHistoryState();
}

class _createHistoryState extends State<createHistory> {
  String? name = '';
  String? email = '';
  String? image = '';
  int? eventNum = 0;
  File? imageXFile;
  Map<String, dynamic>? data;
  List<Map> eventList = [];

  Future _getData() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('event')
        .where('organizer', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    for (var doc in querySnapshot.docs) {
      // Getting data directly
      // Getting data from map
      Map<String, dynamic> data = doc.data();
      eventList.add(data);
    }
    return querySnapshot;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: BuildDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 132, 18, 238),
        title: Text("Created Event"),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: StreamBuilder<QuerySnapshot>(
            // stream: FirebaseFirestore.instance.collection('event').snapshots(),
            stream: FirebaseFirestore.instance
                .collection('event')
                .where('organizer',
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasError) {
                return Text('Error: ${streamSnapshot.error}');
              }
              if (!streamSnapshot.hasData) {
                return CircularProgressIndicator();
              }
              return ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  streamSnapshot.data!.docs[index]['image']),
                              fit: BoxFit.fill),
                        ),
                      ),
                      title: Text(
                        streamSnapshot.data!.docs[index]['title'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {},
                    );
                  });
            },
          )),
    );
  }
}
