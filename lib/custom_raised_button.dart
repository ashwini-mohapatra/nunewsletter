import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {

  CustomRaisedButton({this.height:40.0,this.child,this.color:Colors.red,this.borderradius:16.0,this.onPressed});

  final double height;
  final Widget child;
  final Color color;
  final double borderradius;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        child: child,
        color: color,
        onPressed: onPressed,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(borderradius)),
        ),
      ),
    );
  }
}