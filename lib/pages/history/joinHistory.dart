import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class joinHistory extends StatefulWidget {
  const joinHistory({super.key});

  @override
  State<joinHistory> createState() => _joinHistoryState();
}

class _joinHistoryState extends State<joinHistory> {
  List<String> eventList = [];
  List<Stream<DocumentSnapshot<Map<String, dynamic>>>> combineList = [];

  Future _getData() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('joinedEvent')
        .where('volunteer', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    for (var doc in querySnapshot.docs) {
      // Getting data directly
      // Getting data from map
      Map<String, dynamic> data = doc.data();
      eventList.add(data['event id']);
    }
    print(eventList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: BuildDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 132, 18, 238),
        title: Text("Joined Event"),
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
                      onTap: () {
                        _getData();
                      },
                    );
                  });
            },
          )),
    );
  }
}

class printSnap extends StatefulWidget {
  const printSnap({super.key});

  @override
  State<printSnap> createState() => _printSnapState();
}

class _printSnapState extends State<printSnap> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
