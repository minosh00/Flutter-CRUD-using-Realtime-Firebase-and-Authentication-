import 'package:crud/screens/homepage.dart';
import 'package:crud/services/firabase_services.dart';
import 'package:flutter/material.dart';

class Login_s extends StatefulWidget {
  const Login_s({Key? key}) : super(key: key);

  @override
  State<Login_s> createState() => _Login_sState();
}

class _Login_sState extends State<Login_s> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
          backgroundColor: Colors.blue,
          body: Column(
            children: [
              SizedBox(height: 170,),
              Center(
                child: Container(
                  // height: 400,
                  // width: 400,
                  child: Image.asset("assets/images/logo.png",height: 200,),
                ),
              ),
              SizedBox(height: 30,),
              Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                onPressed: () async {
                  await FirebaseServices().signInWithGoogle();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) =>const HomePage()));
                },
                  style: ButtonStyle(backgroundColor:
                      MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.black26;
                    }
                    return Colors.white;
                  })),
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/google.png",
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Login with Gmail",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                      ),
                )
                ),
          )

            ],
          )
          ),
    );
  }
}
