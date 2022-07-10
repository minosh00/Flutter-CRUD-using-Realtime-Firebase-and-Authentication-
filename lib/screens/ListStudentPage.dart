import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/screens/UpdateStudentPage.dart';
import 'package:crud/screens/login.dart';
import 'package:crud/services/firabase_services.dart';
import 'package:crud/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
                child: Column(
                  children: [
                    Text("Welcome",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.red,width: 2),
                        shape: BoxShape.circle
                      ),
                      child: CircleAvatar(
                      backgroundImage: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!),)),
                    SizedBox(height: 10,),
                    Text("${FirebaseAuth.instance.currentUser!.displayName}",style: TextStyle(fontSize: 18)),
                    // SizedBox(height: 10,),
                    // Text("${FirebaseAuth.instance.currentUser!.email}",style: TextStyle(fontSize: 20,)),
                    SizedBox(height: 30,),
                    Table(
                      border: TableBorder.all(),
                      columnWidths: const <int, TableColumnWidth>{
                        2: FixedColumnWidth(100),
                        0: FixedColumnWidth(100)
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
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
                                child: Text1(storedocs[i]['Name'], 10,
                                    clr: 0xff24292F),
                              ),
                            )),
                            TableCell(
                                child: Container(
                              child: Center(
                                child: Text1(storedocs[i]['Email'], 10,
                                    clr: 0xff24292F),
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
                                                  UpdateStudentPage(
                                                      id: storedocs[i]['id'])))
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.orange,
                                      size: 20,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () =>
                                        {deleteuser(storedocs[i]['id'])},
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
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await FirebaseServices().googleSignOut();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login_s(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 13, 52, 83),
                      ),
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )),
          );
        });
  }
}
