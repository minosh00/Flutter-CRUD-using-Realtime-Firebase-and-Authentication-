import 'package:crud/screens/UpdateStudentPage.dart';
import 'package:crud/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ListStudentPage extends StatefulWidget {
  const ListStudentPage({ Key? key }) : super(key: key);

  @override
  State<ListStudentPage> createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<ListStudentPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Table(
          border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{
            2:FixedColumnWidth(90)
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Container(
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text1("Name", 20,fw: FontWeight.bold,clr: 0xff24292F),
                    ),
                  )
                ),
                TableCell(
                  child: Container(
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text1("Email", 20,fw: FontWeight.bold,clr: 0xff24292F),
                    ),
                  )
                ),
                TableCell(
                  child: Container(
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text1("Action", 20,fw: FontWeight.bold,clr: 0xff24292F),
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
                      child: Text1("Saad", 18,clr: 0xff24292F),
                    ),
                  )
                ),
                TableCell(
                  child: Container(
                    child: Center(
                      child: Text1("muhammdsaad@gmail.com", 18,clr: 0xff24292F),
                    ),
                  )
                ),
                TableCell(
                  child: Container(
                    child: Row(
                      children: [
                        //SizedBox(width: 40,),
                        SizedBox(),
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
                          ),
                          ),
                          IconButton(
                          onPressed: () =>
                          {
                            
                          },
                          icon:Icon( 
                          Icons.delete,
                          color: Colors.red,
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
}