

import 'package:flutter/material.dart';
import 'package:nunewsletter/CreatePost.dart';
import 'package:nunewsletter/EditorHome.dart';

class AlertDialogBox{
Information(BuildContext context,String title, String description){
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(description),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Ok"),
              onPressed: (){
        Navigator.pop(context);
        Navigator.push(context,MaterialPageRoute(builder: (context){
        return EditorHome();
        }));
        }
            ),
          ],
        );
      }
  );
}
}