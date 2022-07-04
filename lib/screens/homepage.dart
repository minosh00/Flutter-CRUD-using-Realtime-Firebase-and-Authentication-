import 'package:crud/screens/AddStudentPage.dart';
import 'package:crud/screens/ListStudentPage.dart';
import 'package:crud/widgets/button_widget.dart';
import 'package:crud/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text1("CRUD Flutter App", 20, fw: FontWeight.bold),
            button1(
              context,
              AddStudentPage(), 
              Text1("Add", 20, fw: FontWeight.bold))
          ],
        ),
      ),
      body: ListStudentPage(),
    );
  }
}