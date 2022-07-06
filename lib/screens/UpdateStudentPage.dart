import 'package:flutter/material.dart';

class UpdateStudentPage extends StatefulWidget {
  const UpdateStudentPage({Key? key}) : super(key: key);

  @override
  State<UpdateStudentPage> createState() => _UpdateStudentPageState();
}

class _UpdateStudentPageState extends State<UpdateStudentPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    updateUser(id, name, email, password) {
      print("user updated");
    }



    return Scaffold(
      appBar: AppBar(title: Text("Update student",style: TextStyle(fontSize: 20),),
      ),

      body: Form(
        key: _formKey,

        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child:ListView(
           children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child:TextFormField(
              initialValue: "saad",
              autofocus: false,
              onChanged: (value)=>{},
              decoration: InputDecoration(
              labelText: 'Name: ',
              labelStyle: TextStyle(fontSize: 20.0),
              border: OutlineInputBorder(),
              errorStyle:
              TextStyle(color: Colors.redAccent, fontSize: 15),
              ),
              validator: (value){
                if(value == null || value.isEmpty)
                {
                  return"Please enter name";
                }
                return null;
              },
            ),
            ),

             Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child:TextFormField(
              initialValue: "saad@gmail.com",
              autofocus: false,
              onChanged: (value)=>{},
              decoration: InputDecoration(
              labelText: 'Email: ',
              labelStyle: TextStyle(fontSize: 20.0),
              border: OutlineInputBorder(),
              errorStyle:
              TextStyle(color: Colors.redAccent, fontSize: 15),
              ),
              validator: (value){
                if(value == null || value.isEmpty)
                {
                  return"Please enter email";
                }
                else if(!value.contains("@"))
                {
                  return"Please enter valid email";
                }
                return null;
              },
            ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child:TextFormField(
              initialValue: "1234",
              autofocus: false,
              onChanged: (value)=>{},
              decoration: InputDecoration(
              labelText: 'Password: ',
              labelStyle: TextStyle(fontSize: 20.0),
              border: OutlineInputBorder(),
              errorStyle:
              TextStyle(color: Colors.redAccent, fontSize: 15),
              ),
              validator: (value){
                if(value == null || value.isEmpty)
                {
                  return"Please enter password";
                }
                return null;
              },
            ),
            ),


             Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                //updateUser(widget.id, name, email, password);
                                Navigator.pop(context);
                              }
                            },
                            child: Text('Update',style: TextStyle(fontSize: 18.0),
                            ),
                            style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 8, 72, 104)),
                          ),
                          ElevatedButton(
                            onPressed: () => {},
                            child: Text('Reset',style: TextStyle(fontSize: 18.0),
                            ),
                            style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 21, 189, 85)),
                          ),
            
             ]
             ),
            ),
           ],
          )
        )
      )
    );
  }
}
