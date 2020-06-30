
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nunewsletter/HomePage.dart';
import 'package:nunewsletter/OneMonthBack.dart';
import 'package:nunewsletter/ThreeMonthBack.dart';
import 'package:nunewsletter/TwoMonthBack.dart';

class NavBloc extends StatefulWidget {

  var t;
  int m,y;
  String s1,s2,s3;

  @override
  _NavBlocState createState() {
    var t1=DateTime.now();
    y=t1.year;
    m=t1.month;
    if(m==1){
      s1="December";
      s2="November";
      s3="October";
    }
    if(m==2){
      s1="January";
      s2="December";
      s3="November";
    }
    if(m==3){
      s1="February";
      s2="January";
      s3="December";
    }
    if(m==4){
      s1="March";
      s2="February";
      s3="January";
    }
    if(m==5){
      s1="April";
      s2="March";
      s3="February";
    }
    if(m==6){
      s1="May";
      s2="April";
      s3="March";
    }
    if(m==7){
      s1="June";
      s2="May";
      s3="April";
    }
    if(m==8){
      s1="July";
      s2="June";
      s3="May";
    }
    if(m==9){
      s1="August";
      s2="July";
      s3="June";
    }
    if(m==10){
      s1="September";
      s2="August";
      s3="July";
    }
    if(m==11){
      s1="October";
      s2="September";
      s3="August";
    }
    if(m==12){
      s1="November";
      s2="October";
      s3="September";
    }
    return _NavBlocState();}
}

class _NavBlocState extends State<NavBloc> {

  var t;
  int m,y;
  String s1,s2,s3;

  @override
  void initState(){
    var t1=DateTime.now();
    y=t1.year;
    m=t1.month;
    if(m==1){
      s1="December";
      s2="November";
      s3="October";
    }
    if(m==2){
      s1="January";
      s2="December";
      s3="November";
    }
    if(m==3){
      s1="February";
      s2="January";
      s3="December";
    }
    if(m==4){
      s1="March";
      s2="February";
      s3="January";
    }
    if(m==5){
      s1="April";
      s2="March";
      s3="February";
    }
    if(m==6){
      s1="May";
      s2="April";
      s3="March";
    }
    if(m==7){
      s1="June";
      s2="May";
      s3="April";
    }
    if(m==8){
      s1="July";
      s2="June";
      s3="May";
    }
    if(m==9){
      s1="August";
      s2="July";
      s3="June";
    }
    if(m==10){
      s1="September";
      s2="August";
      s3="July";
    }
    if(m==11){
      s1="October";
      s2="September";
      s3="August";
    }
    if(m==12){
      s1="November";
      s2="October";
      s3="September";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/nunewsletter.jpeg"),
                    fit: BoxFit.cover
                )
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {Navigator.pop(context)
              ,Navigator.push(context,MaterialPageRoute(builder: (context){
                return HomePage();
              })),},
          ),
          ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text(s1),
              onTap: () => {
                Navigator.pop(context)
                ,Navigator.push(context,MaterialPageRoute(builder: (context){
                  return OneMonthBack();
                })),}),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(s2),
            onTap: () => {
              Navigator.pop(context),
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return TwoMonthBack();
              })),},
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(s3),
            onTap: () => {Navigator.pop(context)
              ,Navigator.push(context,MaterialPageRoute(builder: (context){
                return ThreeMonthBack();
              })),},
          ),
          SizedBox(height: 290.0,),
          Text('Developed By:',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,),textDirection: TextDirection.ltr,),
          SizedBox(height: 10.0,),
          Text('Anushree Krishania',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,),textDirection: TextDirection.ltr,),
          SizedBox(height: 5.0,),
          Text('Ashwini Mohapatra',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,),textDirection: TextDirection.ltr,),
          SizedBox(height: 5.0,),
          Text('Bhavya Narang',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,),textDirection: TextDirection.ltr,),
          SizedBox(height: 5.0,),
          Text('Anoop Gupta',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,),textDirection: TextDirection.ltr,),
        ],
      ),
    );
  }
}

