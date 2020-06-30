import 'package:flutter/material.dart';

class AppliedPosts {
  String name,enrollmentno,batch,year1,img, head, content, date, time,status;
  int month,year,serialno;

  AppliedPosts(
      {@required this.name,@required this.enrollmentno,@required this.batch,@required this.year1,@required this.img, @required this.head, @required this.content,
        @required this.date, @required this.time, @required this.month, @required this.year});
}