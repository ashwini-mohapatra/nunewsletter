import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:nunewsletter/form_submit_button.dart';
import 'dart:math';
class UserUpload extends StatefulWidget {


  @override
  _UserUploadState createState() => _UserUploadState();
}

class _UserUploadState extends State<UserUpload> {
  File sampleImage;
  int month,year,uid;

  String _value=null,_value1=null;
  List<String> _values=new List<String>();
  List<String> _values1=new List<String>();

  @override
  void initState(){
    _values1.addAll(["Batch","B.Tech","MBA","MBA-IDS"]);
    _values.addAll(["Year","1st","2nd","3rd","4th"]);
    _value=_values.elementAt(0);
    _value1=_values1.elementAt(0);
  }

  void _onChanged(String val1){
    setState((){
      _value=val1;
    });
  }
  void _onChanged1(String val2){
    setState((){
      _value1=val2;
    });
  }

  final fk=new GlobalKey<FormState>();
  final TextEditingController _contentcontroller=new TextEditingController();
  final TextEditingController _titlecontroller=new TextEditingController();
  final TextEditingController _serialcontroller=new TextEditingController();
  final TextEditingController _namecontroller=new TextEditingController();
  final TextEditingController _enrollmentcontroller=new TextEditingController();

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
    Random r=new Random();
    uid=r.nextInt(1000000);
    DatabaseReference dbref=FirebaseDatabase.instance.reference();
    dynamic dta={
      "Student Name":_namecontroller.text,
      "Enrollment Number":_enrollmentcontroller.text,
      "Batch":_value1,
      "Year":_value,
      "Image":url,
      "Title":_titlecontroller.text,
      "Description":_contentcontroller.text,
      "Date":date,
      "Time":time,
      "Month Digit":month,
      "Year Digit":year,
    };
    dbref.child("Applied Posts").push().set(dta);
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
      child: SingleChildScrollView(
        child:Form(
        key: fk,
        child: Column(
          children: <Widget>[
            Image.file(sampleImage,height:300.0,width:600.0,),
            SizedBox(height: 20.0,),
            TextField(decoration: InputDecoration(
              labelText: 'Student Name',
            ),
              controller: _namecontroller,
            ),
            SizedBox(height: 20.0,),
            TextField(decoration: InputDecoration(
              labelText: 'Enrollment Number',
            ),
              controller: _enrollmentcontroller,
            ),
            SizedBox(height: 20.0,),
            DropdownButton(value: _value,items: _values.map((String val1){
              return DropdownMenuItem(value: val1,child: Text(val1),);
            }).toList(),onChanged: (String a){_onChanged(a);},),
            SizedBox(height: 20.0,),
            DropdownButton(value: _value1,items: _values1.map((String val2){
              return DropdownMenuItem(value: val2,child: Text(val2),);
            }).toList()
              ,onChanged: (String b){_onChanged1(b);},),
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
      ),
    );
  }
}
