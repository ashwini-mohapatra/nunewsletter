import 'package:flutter/material.dart';

class Posts {
  String img, head, content, date, time;
  int month,year,serialno;

  Posts(
      {@required this.img, @required this.head, @required this.content,
        @required this.date, @required this.time, @required this.month, @required this.year});
}