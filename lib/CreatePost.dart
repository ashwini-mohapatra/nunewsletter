

import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nunewsletter/form_submit_button.dart';

class UploadData extends StatefulWidget {


  @override
  _UploadDataState createState() => _UploadDataState();
}

class _UploadDataState extends State<UploadData> {
  File sampleImage;
  int month,year;
  final fk=new GlobalKey<FormState>();
  final TextEditingController _contentcontroller=new TextEditingController();
  final TextEditingController _titlecontroller=new TextEditingController();
  final TextEditingController _serialcontroller=new TextEditingController();

  Future getImage() async{
    var temp=await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImage=temp;
    });
  }

  void uploadimg() async{
    final StorageReference strf=FirebaseStorage.instance.ref().child("Post Images");
    var dt=DateTime.now();
    final StorageUploadTask uptsk=strf.child(dt.toString()+".jpg").putFile(sampleImage);
    var imurl=await(await uptsk.onComplete).ref.getDownloadURL();
    upload(imurl.toString());
  }

  void upload(url){
    var t1=DateTime.now();
    month=t1.month;
    year=t1.year;
    var t2=DateFormat('MMM dd, yyyy');
    var t3=DateFormat('EEEE, hh:mm aaa');
    String date=t2.format(t1);
    String time=t3.format(t1);
    DatabaseReference dbref=FirebaseDatabase.instance.reference();
    dynamic dta={
      "Serial Number":_serialcontroller.text,
      "Image":url,
      "Title":_titlecontroller.text,
      "Description":_contentcontroller.text,
      "Date":date,
      "Time":time,
      "Month Digit":month,
      "Year Digit":year,
    };
    dbref.child("Posts").push().set(dta);
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Post"),
        centerTitle: true,
      ),
      body: Center(
        child: sampleImage==null?Text("Select and Image"):enableUpload(),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Add Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
  Widget enableUpload(){
    return Container(
      child: Form(
        key: fk,
        child: Column(
          children: <Widget>[
            Image.file(sampleImage,height:300.0,width:600.0,),
            SizedBox(height: 20.0,),
            TextField(decoration: InputDecoration(
              labelText: 'Post Serial Number',
            ),
              controller: _serialcontroller,),
            SizedBox(height: 20.0,),
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: _titlecontroller,
            ),
            SizedBox(height: 20.0,),
            TextField(decoration: InputDecoration(
              labelText: 'Description',
            ),
              controller: _contentcontroller,
            ),
            SizedBox(height: 20.0,),
            FormSubmitButton(
              text: "Upload Post",
              onPressed: uploadimg,
            ),
          ],
        ),
      ),
    );
  }
}
