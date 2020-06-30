import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';

void main() => runApp(button_new());

class button_new extends StatelessWidget{
  get base64Image => null;

  get msg => null;

  @override
  Widget build(BuildContext context) {
    return 
FloatingActionButton(
  onPressed: () {
    FlutterShareMe().shareToWhatsApp(base64Image: base64Image, msg: msg);
  },
  tooltip: 'Increment',
  child: Icon(Icons.add),
); 
    
  }


}