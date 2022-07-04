import 'package:flutter/material.dart';
Widget button1(context,rt,child_widget) 
{
  return ElevatedButton(
    onPressed: () => {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => rt,
          ))
    },
    style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 13, 52, 83),),
    child: child_widget,
  );
}
