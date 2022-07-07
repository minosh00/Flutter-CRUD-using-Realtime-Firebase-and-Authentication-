import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/screens/UpdateStudentPage.dart';
import 'package:crud/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ListStudentPage extends StatefulWidget {
  const ListStudentPage({ Key? key }) : super(key: key);

  @override
  State<ListStudentPage> createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<ListStudentPage> {

  //instance
  // final Stream<QuerySnapshot> studentsstream=FirebaseFirestore.instance.collection("students").snapshots();
   final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('students').snapshots();
  
  @override
  Widget build(BuildContext context) {


     return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
           // a['id'] = document.id;
          }).toList();
          
         
           
          // final List storedoc = [];

          // snapshot.data!.docs.map((DocumentSnapshot document)
          // {
          //   Map a=document.data() as Map<String,dynamic>;
          //   storedoc.add(a);
          //   //to show on console
           
          // }
          // ).toList();


          return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Table(
          border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{
            2:FixedColumnWidth(100),
            0:FixedColumnWidth(100)
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Container(
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text1("Name", 15,fw: FontWeight.bold,clr: 0xff24292F),
                    ),
                  )
                ),
                TableCell(
                  child: Container(
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text1("Email", 15,fw: FontWeight.bold,clr: 0xff24292F),
                    ),
                  )
                ),
                TableCell(
                  child: Container(
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text1("Action", 15,fw: FontWeight.bold,clr: 0xff24292F),
                    ),
                  )
                ),
              ]
            ),
            TableRow(
              children: [
                TableCell(
                  child: Container(
                   
                    child: Center(
                      child: Text1("Saad", 10,clr: 0xff24292F),
                    ),
                  )
                ),
                TableCell(
                  child: Container(
                    child: Center(
                      child: Text1("muhammdsaad@gmail.com", 10,clr: 0xff24292F),
                    ),
                  )
                ),
                TableCell(
                  child: Container(
                    child: Row(
                      children: [
                        //SizedBox(width: 40,),
                       
                        IconButton(
                          onPressed: () =>
                          {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context)=>UpdateStudentPage() )
                                )
                          },
                          icon:Icon( 
                          Icons.edit,
                          color: Colors.orange,
                          size: 20,
                          ),
                          ),
                          IconButton(
                          onPressed: () =>
                          {
                             //print(storedoc)
                          },
                          icon:Icon( 
                          Icons.delete,
                          color: Colors.red,
                          size: 20,
                          ),
                          ),
                      ],
                    ),
                  )
                ),
              ]
            )
          ],
        ),
      ),
    );
        }
      
      );
    
  }
}