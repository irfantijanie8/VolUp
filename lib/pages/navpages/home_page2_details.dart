import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../misc/colors.dart';
import 'detail_page2.dart';
import 'donations.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('event').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final event = snapshot.data?.docs;

            print("====================================");

            print("event length ${event?.length}");
            print(event![1]["Bank Name"]);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppColors.kDefaultPaddin),
                ),
                Categories(),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppColors.kDefaultPaddin),
                  child: GridView.builder(
                      itemCount: event.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: AppColors.kDefaultPaddin,
                        crossAxisSpacing: AppColors.kDefaultPaddin,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) => itemCard(
                          bankName: event[index]["Bank Name"],
                          bankAcc: event[index]["Bank Account"],
                          description: event[index]["description"],
                          eventDate: event[index]["event date"],
                          eventTime: event[index]["event time"],
                          image: event[index]["image"],
                          ingredients1: event[index]["ingredient 1"],
                          ingredients2: event[index]["ingredient 2"],
                          ingredients3: event[index]["ingredient 3"],
                          location: event[index]["location"],
                          needs1: event[index]["needs 1"],
                          need2: event[index]["needs 2"],
                          need3: event[index]["needs 3"],
                          need4: event[index]["needs 4"],
                          organizer: event[index]["organizer"],
                          title: event[index]["title"],
                          latitude: event[index]["latitude"],
                          longitude: event[index]["longitude"],
                          index: index)),
                ))
              ],
            );
          }),
    );
  }
}

class itemCard extends StatelessWidget {
  //final EventDetails eventList;
  final int index;

  //final String id;
  final String bankName,
      bankAcc,
      description,
      eventDate,
      eventTime,
      image,
      ingredients1,
      ingredients2,
      ingredients3,
      location,
      needs1,
      need2,
      need3,
      need4,
      organizer,
      title;

  final double latitude, longitude;

  const itemCard({
    Key? key,
    //required this.eventList,
    required this.index,
    required this.bankName,
    required this.bankAcc,
    required this.description,
    required this.eventDate,
    required this.eventTime,
    required this.image,
    required this.ingredients1,
    required this.ingredients2,
    required this.ingredients3,
    required this.location,
    required this.needs1,
    required this.need2,
    required this.need3,
    required this.need4,
    required this.organizer,
    required this.title,
    required this.longitude,
    required this.latitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            //final event = snapshot.data?.docs;
            final gettingId = snapshot.data!.docs
                .firstWhere((doc) => doc.id == organizer)
                .data() as Map<String, dynamic>;
            // print("=====================");
            //print(gettingId["fullName"]);

            //print(gettingId);
            //print(event2['title']);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(AppColors.kDefaultPaddin),

                    // height: 200,
                    //width: 160,
                    decoration: BoxDecoration(
                        color: AppColors.outline,
                        borderRadius: BorderRadius.circular(16)),
                    child: Image.network(image),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => detailPage2(
                                userName: gettingId["fullName"],
                                title: title,
                                description: description,
                                location: location,
                                bankName: bankName,
                                bankAcc: bankAcc,
                                eventDate: eventDate,
                                eventTime: eventTime,
                                image: image,
                                ingredients1: ingredients1,
                                ingredients2: ingredients2,
                                ingredients3: ingredients3,
                                needs1: needs1,
                                need2: need2,
                                need3: need3,
                                need4: need4,
                                longitude: longitude,
                                latitude: latitude,
                              )),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppColors.kDefaultPaddin / 4),
                    child: Text(
                      eventDate,
                      style: TextStyle(color: AppColors.kTextLightColor),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => detailPage2(
                                userName: gettingId["fullName"],
                                title: title,
                                description: description,
                                location: location,
                                bankName: bankName,
                                bankAcc: bankAcc,
                                eventDate: eventDate,
                                eventTime: eventTime,
                                image: image,
                                ingredients1: ingredients1,
                                ingredients2: ingredients2,
                                ingredients3: ingredients3,
                                needs1: needs1,
                                need2: need2,
                                need3: need3,
                                need4: need4,
                                longitude: longitude,
                                latitude: latitude,
                              )),
                    );
                  },
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

// the thing above on that that thing
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  List<String> categories = [
    "List Event",
    "Organization",
    "Donation",
    " Admin"
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppColors.kDefaultPaddin),
      child: SizedBox(
          height: 25,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => buildCategory(
                    index,
                  ))),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Donation()),
            );
          }
        });
      },
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppColors.kDefaultPaddin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index
                    ? AppColors.kTextColor
                    : AppColors.kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: AppColors.kDefaultPaddin / 4),
              height: 2,
              width: 30,
              color: selectedIndex == index
                  ? Color.fromARGB(255, 40, 4, 65)
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}

//
//           final gettingId = snapshot.data!.docs.firstWhere((doc) => doc.id == "the document Id").data() as Map<String, dynamic>;
