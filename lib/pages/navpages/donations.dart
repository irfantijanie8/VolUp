import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../misc/colors.dart';

class Donation extends StatefulWidget {
  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      //drawer: BuildDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 98, 67, 184),
        title: Text("Donation Info"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              decoration: InputDecoration(hintText: "Search for a Donation..."),
              onChanged: (text) {
                setState(() {
                  _searchText = text;
                });
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('event')
                    .where("title", isGreaterThanOrEqualTo: _searchText)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final event = snapshot.data?.docs;
                  print("food length is ${event?.length}");
                  return ListView.builder(
                    itemCount: event?.length,
                    itemBuilder: (context, index) {
                      final event2 = event![index];
                      return ListTile(
                        title: Text(event2['title'],style: TextStyle(
              fontWeight: FontWeight.bold,
              color:AppColors.mainText,
            ),),
                        subtitle: Text('Bank Name is : ${event2['Bank Name']},',style: TextStyle(
              color:AppColors.mainText,
            ),), 
                        trailing: Padding(
                          padding: EdgeInsets.only(top: 14),
                          child: Column(
                            children: <Widget>[
                              Text('Bank Account : ${event2['Bank Account']} ',
                              style: TextStyle(
              fontWeight: FontWeight.bold,
              color:AppColors.textColor1,
            ),),
                              Text('Date: ${event2['event date']} ',
                              style: TextStyle(
              
              color:AppColors.Secondary,
            ),),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}