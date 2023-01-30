import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../misc/colors.dart';
import '../../widgets/asdfghj.dart';

class volList extends StatefulWidget {
  @override
  _volListState createState() => _volListState();
}

class _volListState extends State<volList> {
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
        title: Text("volList"),
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

                  return ListView.builder(
                    itemCount: Namesadsad.length,
                    itemBuilder: (context, index) {
                      final event2 = event![index];
                      return ListTile(
                        title: Text(
                          Namesadsad[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainText,
                          ),
                        ),
                        trailing: Padding(
                          padding: EdgeInsets.only(top: 14),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Gmail : ${gmail[index]} ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor1,
                                ),
                              ),
                              Text(
                                'Date: ${event2['event date']} ',
                                style: TextStyle(
                                  color: AppColors.Secondary,
                                ),
                              ),
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
