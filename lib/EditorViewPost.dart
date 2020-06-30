import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nunewsletter/EditorHome.dart';
class EditorViewData extends StatelessWidget {
  String name,enrollmentno,batch,year1,time,img,date,content,heading;
  String status;
  File sampleImage;
  int month,year;

  EditorViewData({@required this.status:'Pending',@required this.name:'A',@required this.enrollmentno:'B',@required this.batch:'C',@required this.year1:'D',@required this.img:'E'
    ,@required this.heading:'F',@required this.content:'G',@required this.date,@required this.time});


  void upload(){
    var t1=DateTime.now();
    month=t1.month;
    year=t1.year;
    var t2=DateFormat('MMM dd, yyyy');
    var t3=DateFormat('EEEE, hh:mm aaa');
    String date1=t2.format(t1);
    String time1=t3.format(t1);
    DatabaseReference dbref=FirebaseDatabase.instance.reference();
    dynamic dta={
      "Image":img,
      "Title":heading,
      "Description":content,
      "Date":date1,
      "Time":time1,
      "Month Digit":month,
      "Year Digit":year,
    };
    dbref.child("Posts").push().set(dta);
  }

  void approve(){
  upload();
  }
  void reject(){
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(heading),
      ),
      body: SingleChildScrollView(
          child:Card(
            elevation: 10.0,
            margin: EdgeInsets.all(15.0),
            child: Container(
              padding: EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 12.0,),
                  Text(
                    status,
                    style: Theme.of(context).textTheme.title,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        date,
                        style: Theme.of(context).textTheme.subtitle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        time,
                        style: Theme.of(context).textTheme.subtitle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0,),
                  Image.network(img,fit: BoxFit.cover,),
                  SizedBox(height: 12.0,),
                  Text(
                    heading,
                    style: Theme.of(context).textTheme.title,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 12.0,),
                  Text(
                    content,
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        name,
                        style: Theme.of(context).textTheme.subtitle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        enrollmentno,
                        style: Theme.of(context).textTheme.subtitle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        batch,
                        style: Theme.of(context).textTheme.subtitle,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        year1,
                        style: Theme.of(context).textTheme.subtitle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(child: Text('Reject',style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      ),
                        onPressed: reject,),
                      FlatButton(child: Text('Approve',style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      ),
                        onPressed: approve,),
                    ],
                  ),
                ],
              ),
            ),
          )
      ),
    );

  }
}
