import 'package:crud/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({Key? key}) : super(key: key);

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    var name = "";
    var email = "";
    var password = "";
    // Create a text controller and use it to retrieve the current value
    // of the TextField.
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      nameController.dispose();
      emailController.dispose();
      passwordController.dispose();
      super.dispose();
    }

    clearText() {
      nameController.clear();
      emailController.clear();
      passwordController.clear();
    }

    addUser() {
      print("user added!");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text1("Add new student", 20),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15)),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("Please enter name");
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15)),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("Please enter email");
                    } else if (!value.contains("@")) {
                      return ("Enter a valid emeil");
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 20,
                      ),
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15)),
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("Please enter password");
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
                            setState(() {
                              name = nameController.text;
                              email = emailController.text;
                              password = passwordController.text;
                              addUser();
                              clearText();
                            });
                          }
                        },
                        child: Text("Register", style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 8, 72, 104)),
                        ),

                        ElevatedButton(
                        onPressed: () => {clearText()},
                        child: Text('Reset',style: TextStyle(fontSize: 18.0),
                        ),
                        style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 21, 189, 85)),
                        ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
