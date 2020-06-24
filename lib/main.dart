import 'package:flutter/material.dart';
import 'package:nunewsletter/HomePage.dart';

void main(){
  runApp(NUNewsletterApp());
}
class NUNewsletterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Anukriti - NU Newsletter",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}
