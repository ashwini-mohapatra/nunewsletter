
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nunewsletter/AppliedPosts.dart';
import 'package:nunewsletter/CreatePost.dart';
import 'package:nunewsletter/EditorLogin.dart';
import 'package:nunewsletter/EditorViewPost.dart';
import 'package:nunewsletter/HomePage.dart';
import 'package:nunewsletter/Navigationbloc.dart';
import 'package:nunewsletter/Posts.dart';
import 'package:nunewsletter/ViewPost.dart';

class EditorHome extends StatefulWidget {

  var key12;
  var data12;
  List<AppliedPosts> postlist1=[];

  @override
  _EditorHomeState createState(){
    DatabaseReference dbref=FirebaseDatabase.instance.reference().child("Applied Posts");
    dbref.once().then((DataSnapshot snapshot){
      key12=snapshot.value.keys;
      data12=snapshot.value;
      postlist1.clear();
      for(var ik in key12){
        AppliedPosts posts=new AppliedPosts(name:data12[ik]['Student Name'],enrollmentno:data12[ik]['Enrollment Number'],batch:data12[ik]['Batch'],
            year1:data12[ik]['Year'],img: data12[ik]['Image'], head: data12[ik]['Title'], content: data12[ik]['Description'],
            date: data12[ik]['Date'], time: data12[ik]['Time']);
        postlist1.add(posts);
      }
    });
    return _EditorHomeState(postlist1);
  }
}

class _EditorHomeState extends State<EditorHome> {

  var key1;
  var data1;
  String status;
  List<AppliedPosts> postlist=[];

  _EditorHomeState(List<AppliedPosts> postlist1){
    postlist=postlist1;
  }

  void home(){
    Navigator.push(context,MaterialPageRoute(builder: (context){
      return EditorHome();
    }));
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
    DatabaseReference dbref=FirebaseDatabase.instance.reference().child("Applied Posts");
    dbref.once().then((DataSnapshot snapshot){
      key1=snapshot.value.keys;
      data1=snapshot.value;
      postlist.clear();
      for(var ik in key1){
        AppliedPosts posts=new AppliedPosts(name:data1[ik]['Student Name'],enrollmentno:data1[ik]['Enrollment Number'],batch:data1[ik]['Batch'],
            year1:data1[ik]['Year'],img: data1[ik]['Image'], head: data1[ik]['Title'], content: data1[ik]['Description'],
            date: data1[ik]['Date'], time: data1[ik]['Time']);
        postlist.add(posts);
      }
    });
  }


  void signin() {
    Navigator.pop(context);
  }

  void searchpls(){

  }
 void upload(){
   Navigator.push(context,MaterialPageRoute(builder: (context){
     return UploadData();
   }));
 }

  void approve(){

  }
  void reject(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anukriti Editor"),
        actions: <Widget>[
          FlatButton(
            child: Text('Editor Logout',style: TextStyle(
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
                return PostUI(postlist[index].name,postlist[index].enrollmentno,postlist[index].batch,postlist[index].year1,
                    postlist[index].img,postlist[index].head,postlist[index].content,postlist[index].date,
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
              IconButton(
                icon: Icon(Icons.camera),
                iconSize: 30,
                color: Colors.white,
                onPressed: upload,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget PostUI(String n,String e,String y,String b,String img, String heading, String content,String date, String time){
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
            ],
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return EditorViewData(name:n,enrollmentno:e,batch:b,year1:y,img:img,heading:heading,content:content,date:date,time:time);
        }));
      },
    );
  }
}
