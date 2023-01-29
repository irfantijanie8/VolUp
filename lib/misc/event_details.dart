

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class EventDetails{

String id;
   String bankName,
   bankAcc,
   description,
   eventDate,
  eventTime,
  image,
  ingredients1,ingredients2,ingredients3,
  location,
  
  needs1,
  need2,
  need3,
  need4,
  organizer,
   title;

  double latitude,longitude;
  
  
 
  //x buat lagi
 
  
  EventDetails({
    this.id='',
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


  });
/*
  Map<String, dynamic> toJson()=>{
    'id' : id,
    'bankName' : bankName,
   'bankAcc' : bankAcc,
   'description':description,
   'eventDate':eventDate,
  'eventTime':eventTime,
  'image':image,
  'ingredients1':ingredients1,
  'ingredients2':ingredients2,
  'ingredients3':ingredients3,
  'location':location,
  
  'needs1':needs1,
  'needs2':need2,
  'needs3':need3,
  'needs4':need4,
  'organizer':organizer,
   'title':title

  };
*/
  static EventDetails fromJson (Map<String, dynamic>json )=>EventDetails(
       id:json['id']  ,
     bankName:json['bankName'],
   bankAcc:json['bankAcc'] ,
  description:json['description'],
   eventDate:json['eventDate'],
  eventTime:json['eventTime'],
  image:json['image'],
  ingredients1:json['ingredients1'],
  ingredients2:json['ingredients2'],
  ingredients3:json['ingredients3'],
  location:json['location'],
  
  needs1:json['needs1'],
  need2:json['need2'],
  need3:json['need3'],
  need4:json['need4'],
  organizer:json['organizer'],
  title :json['title'],
  latitude: json['latitude'],
  longitude: json ['longitude'],
  );

    factory EventDetails.fromMap(Map<dynamic, dynamic> map) {
    return EventDetails(
            id:map['id']  ,
     bankName:map['bankName'],
   bankAcc:map['bankAcc'] ,
  description:map['description'],
   eventDate:map['eventDate'],
  eventTime:map['eventTime'],
  image:map['image'],
  ingredients1:map['ingredients1'],
  ingredients2:map['ingredients2'],
  ingredients3:map['ingredients3'],
  location:map['location'],
  
  needs1:map['needs1'],
  need2:map['need2'],
  need3:map['need3'],
  need4:map['need4'],
  organizer:map['organizer'],
  title :map['title'],
  latitude: map['latitude'],
  longitude: map ['longitude'],
    );
  }

}


List event_play=[];


  Future<void> getData() async {

CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('event');

    List<Map> eventList = [];

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    //final allData = querySnapshot.docs.map((doc) => doc.data());

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = Map<String, dynamic>.from(querySnapshot.docs[i].data() as Map);
      eventList.add(a);
    }

    //var data = Map<String, dynamic>.from(querySnapshot.docs[1].data() as Map);
    
    //print(eventList[i]);
    //List forReturn = [ eventList[i]['Bank Name'], eventList[i]['Organization']];

    event_play.add( EventDetails(
    id:"try1",
   bankName:"try1",
   bankAcc:"try1",
   description:"try1",
   eventDate:"try1",
  eventTime:"try1",
  image:"images/mountain.jpeg",
  ingredients1:"try1",ingredients2:"try1",ingredients3:"try1",
  location:"try1",
  
  needs1:"try1",
  need2:"try1",
  need3:"try1",
  need4:"try1",
  organizer:"try1",
   title:"try1",

  latitude :100.30024521052837,
  longitude:100.30024521052837,));
  event_play.add( EventDetails(
    id:"try1",
   bankName:"try1",
   bankAcc:"try1",
   description:"try1",
   eventDate:"try1",
  eventTime:"try1",
  image:"images/mountain.jpeg",
  ingredients1:"try1",ingredients2:"try1",ingredients3:"try1",
  location:"try1",
  
  needs1:"try1",
  need2:"try1",
  need3:"try1",
  need4:"try1",
  organizer:"try1",
   title:"try1",

  latitude :100.30024521052837,
  longitude:100.30024521052837,));
    }

//List<EventDetails> event_play=[];


List<EventDetails> event_info=[


  EventDetails(

  
    id:"try1",
   bankName:"try1",
   bankAcc:"try1",
   description:"try1",
   eventDate:"try1",
  eventTime:"try1",
  image:"images/mountain.jpeg",
  ingredients1:"try1",ingredients2:"try1",ingredients3:"try1",
  location:"try1",
  
  needs1:"try1",
  need2:"try1",
  need3:"try1",
  need4:"try1",
  organizer:"try1",
   title:"try1",

  latitude :100.30024521052837,
  longitude:100.30024521052837,
  ),
    EventDetails(
    id:"try2",
   bankName:"try2",
   bankAcc:"try1",
   description:"try1",
   eventDate:"try1",
  eventTime:"try1",
  image:"images/mountain.jpeg",
  ingredients1:"try1",ingredients2:"try1",ingredients3:"try1",
  location:"try1",
  
  needs1:"try2",
  need2:"try1",
  need3:"try1",
  need4:"try1",
  organizer:"try1",
   title:"try1",

  latitude :100.30024521052837,
  longitude:100.30024521052837,
  ),
    EventDetails(
    id:"try3",
   bankName:"try3",
   bankAcc:"try1",
   description:"try1",
   eventDate:"try1",
  eventTime:"try1",
  image:"images/mountain.jpeg",
  ingredients1:"try1",ingredients2:"try1",ingredients3:"try1",
  location:"try1",
  
  needs1:"try1",
  need2:"try1",
  need3:"try1",
  need4:"try1",
  organizer:"try1",
   title:"try1",

  latitude :100.30024521052837,
  longitude:100.30024521052837,
  ),
    EventDetails(
    id:"try4",
   bankName:"try1",
   bankAcc:"try1",
   description:"try1",
   eventDate:"try1",
  eventTime:"try1",
  image:"images/mountain.jpeg",
  ingredients1:"try1",ingredients2:"try1",ingredients3:"try1",
  location:"try1",
  
  needs1:"try1",
  need2:"try1",
  need3:"try1",
  need4:"try1",
  organizer:"try1",
   title:"try1",

  latitude :100.30024521052837,
  longitude:100.30024521052837,
  ),
    EventDetails(
    id:"try5",
   bankName:"try1",
   bankAcc:"try1",
   description:"try1",
   eventDate:"try1",
  eventTime:"try1",
  image:"images/mountain.jpeg",
  ingredients1:"try1",ingredients2:"try1",ingredients3:"try1",
  location:"try1",
  
  needs1:"try1",
  need2:"try1",
  need3:"try1",
  need4:"try1",
  organizer:"try1",
   title:"try1",

  latitude :100.30024521052837,
  longitude:100.30024521052837,
  ),
    EventDetails(
    id:"try6",
   bankName:"try1",
   bankAcc:"try1",
   description:"try1",
   eventDate:"try1",
  eventTime:"try1",
  image:"images/mountain.jpeg",
  ingredients1:"try1",ingredients2:"try1",ingredients3:"try1",
  location:"try1",
  
  needs1:"try1",
  need2:"try1",
  need3:"try1",
  need4:"try1",
  organizer:"try1",
   title:"try1",

  latitude :100.30024521052837,
  longitude:100.30024521052837,
  ),
] ;

/*class eventDatabaseManager{
  Future getUserList() async
  {
    try{

    }cathc(e)
    {
      print(e.toString());
    }
  }
}
*/
