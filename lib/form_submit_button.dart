import 'package:flutter/material.dart';
import 'package:nunewsletter/custom_raised_button.dart';

class FormSubmitButton extends CustomRaisedButton{
  FormSubmitButton({@required String text,VoidCallback onPressed})
      :super(
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 20.0),
    ),
    height: 44.0,
    color: Colors.red,
    borderradius: 4.0,
    onPressed: onPressed,
  );
}