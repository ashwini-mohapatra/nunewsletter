import 'package:flutter/material.dart';
class ViewData extends StatelessWidget {
  String time,img,date,content,heading;


  ViewData({@required this.img,@required this.heading,@required this.content,@required this.date,@required this.time});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(heading),
      ),
      body: SingleChildScrollView(
          child:Card(
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
                  Text(
                    content,
                    style: Theme.of(context).textTheme.subtitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
      ),
    );

  }
}
