import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nunewsletter/CreatePost.dart';
import 'package:nunewsletter/EditorLogin.dart';
import 'package:nunewsletter/HomePage.dart';
import 'package:nunewsletter/Navigationbloc.dart';
import 'package:nunewsletter/Posts.dart';
import 'package:nunewsletter/ViewPost.dart';
class TwoMonthBack extends StatefulWidget {

  var key12;
  var data12;
  List<Posts> postlist1=[];

  @override
  _TwoMonthBackState createState() {
    DatabaseReference dbref=FirebaseDatabase.instance.reference().child("Posts");
    dbref.once().then((DataSnapshot snapshot){
      key12=snapshot.value.keys;
      data12=snapshot.value;
      postlist1.clear();
      var t=DateTime.now();
      int m=t.month;
      int y=t.year;
      m=m-2;
      if(m<1){
        m=11;
        y=y-1;
      }
      for(var ik in key12){
        if(y==data12[ik]['Year Digit']){
          if(m==data12[ik]['Month Digit']){
            Posts posts=new Posts(img: data12[ik]['Image'], head: data12[ik]['Title'], content: data12[ik]['Description'],
                date: data12[ik]['Date'], time: data12[ik]['Time'],month: data12[ik]['Month Digit'],year: data12[ik]['Year Digit']);
            postlist1.add(posts);
          }
        }
      }
    });
    return _TwoMonthBackState(postlist1);


  }
}

class _TwoMonthBackState extends State<TwoMonthBack> {

  var key1;
  var data1;
  List<Posts> postlist=[];

  _TwoMonthBackState(List<Posts> postlist1){
    postlist=postlist1;
  }

  void home(){
    HomePage();
  }
  void add(){
    Navigator.push(context,MaterialPageRoute(builder: (context){
      return UploadData();
    }));
  }
  void profile(){

  }

  @override
  void initState(){
    super.initState();
    DatabaseReference dbref=FirebaseDatabase.instance.reference().child("Posts");
    dbref.once().then((DataSnapshot snapshot){
      key1=snapshot.value.keys;
      data1=snapshot.value;
      postlist.clear();
      var t=DateTime.now();
      int m=t.month;
      int y=t.year;
      m=m-2;
      if(m<1){
        m=11;
        y=y-1;
      }
      for(var ik in key1){
        if(y==data1[ik]['Year Digit']){
          if(m==data1[ik]['Month Digit']){
            Posts posts=new Posts(img: data1[ik]['Image'], head: data1[ik]['Title'], content: data1[ik]['Description'],
                date: data1[ik]['Date'], time: data1[ik]['Time'],month: data1[ik]['Month Digit'],year: data1[ik]['Year Digit']);
            postlist.add(posts);
          }
        }
      }
    });
  }


  void signin() {
    Navigator.push(context,MaterialPageRoute(builder: (context){
      return SignInSignUp();
    }));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBloc(),
      appBar: AppBar(
        title: Text("April"),
        actions: <Widget>[
          FlatButton(
            child: Text('Editor Login',style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
            ),
            onPressed: signin,
          ),
        ],
      ),
      body: Container(
          child: (postlist.length==0)? Text("No Blog Post Available. \n Press Home bottom at "
              "Bottom Left followed by Back Button at Bottom Right to refresh",
            textAlign: TextAlign.center,) : ListView.builder(
              itemCount: postlist.length,
              itemBuilder: (_, index){
                return PostUI(postlist[index].img,postlist[index].head,postlist[index].content,postlist[index].date,
                    postlist[index].time);
              }
          )
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red,
        child: Container(
          margin: EdgeInsets.only(left: 25.0,right: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                iconSize: 30,
                color: Colors.white,
                onPressed: home,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget PostUI(String img, String heading, String content,String date, String time){
    return RaisedButton(
      child: Card(
        elevation: 10.0,
        margin: EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
            ],
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ViewData(img:img,heading:heading,content:content,date:date,time:time);
        }));
      },
    );
  }
}
