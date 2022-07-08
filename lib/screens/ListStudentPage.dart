import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/screens/UpdateStudentPage.dart';
import 'package:crud/widgets/text_widget.dart';
import 'package:flutter/material.dart';


class ListStudentPage extends StatefulWidget {
  const ListStudentPage({Key? key}) : super(key: key);

  @override
  State<ListStudentPage> createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<ListStudentPage> {
  
  //for reading data
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('students').snapshots();
  
  //for deleting data
  CollectionReference students =
      FirebaseFirestore.instance.collection('students');

  Future<void> deleteuser(id) {
    return students
        .doc(id)
        .delete()
        .then((value) => print("User deleted $id"))
        .catchError((Error) => print("Failed to delete user: $Error"));
  }

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
            a['id'] = document.id; //for deleting we need unique id
          }).toList();

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  2: FixedColumnWidth(100),
                  0: FixedColumnWidth(100)
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [
                    TableCell(
                        child: Container(
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text1("Name", 15,
                            fw: FontWeight.bold, clr: 0xff24292F),
                      ),
                    )),
                    TableCell(
                        child: Container(
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text1("Email", 15,
                            fw: FontWeight.bold, clr: 0xff24292F),
                      ),
                    )),
                    TableCell(
                        child: Container(
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text1("Action", 15,
                            fw: FontWeight.bold, clr: 0xff24292F),
                      ),
                    )),
                  ]),
                  for (var i = 0; i < storedocs.length; i++) ...[
                    TableRow(children: [
                      TableCell(
                          child: Container(
                        child: Center(
                          child:
                              Text1(storedocs[i]['Name'], 10, clr: 0xff24292F),
                        ),
                      )),
                      TableCell(
                          child: Container(
                        child: Center(
                          child:
                              Text1(storedocs[i]['Email'], 10, clr: 0xff24292F),
                        ),
                      )),
                      TableCell(
                          child: Container(
                        child: Row(
                          children: [
                            //SizedBox(width: 40,),

                            IconButton(
                              onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UpdateStudentPage(id:storedocs[i]['id'])))
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.orange,
                                size: 20,
                              ),
                            ),
                            IconButton(
                              onPressed: () => {deleteuser(storedocs[i]['id'])},
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      )),
                    ])
                  ]
                ],
              ),
            ),
          );
        });
  }
}
