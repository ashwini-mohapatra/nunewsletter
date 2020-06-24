
import 'package:flutter/material.dart';
import 'package:nunewsletter/HomePage.dart';
import 'package:nunewsletter/OneMonthBack.dart';
import 'package:nunewsletter/ThreeMonthBack.dart';
import 'package:nunewsletter/TwoMonthBack.dart';

class NavBloc extends StatelessWidget {

  var t;
  int m,y;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
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
            title: Text('May'),
            onTap: () => {
              Navigator.pop(context)
              ,Navigator.push(context,MaterialPageRoute(builder: (context){
            return OneMonthBack();
            })),}),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text('April'),
            onTap: () => {
          Navigator.pop(context),
            Navigator.push(context,MaterialPageRoute(builder: (context){
            return TwoMonthBack();
            })),},
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text('March'),
            onTap: () => {Navigator.pop(context)
            ,Navigator.push(context,MaterialPageRoute(builder: (context){
            return ThreeMonthBack();
            })),},
          ),

        ],
      ),
    );
  }
}
