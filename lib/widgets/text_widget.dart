import 'package:flutter/cupertino.dart';

Widget Text1(String txt,double sz,{clr=0xffFFFFFF,fw=FontWeight.normal}) {
  return Text(
    txt,style: TextStyle(color: Color(clr),fontSize: sz,fontWeight: fw,),
  );
}
