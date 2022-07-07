import 'package:crud/firebase_options.dart';
import 'package:crud/screens/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //     future: _initialization,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasError) {
    //         print("Something went wrong");
    //       }
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         return MaterialApp(
    //           debugShowCheckedModeBanner: false,
    //           home: HomePage(),
    //         );
    //       }
    //       return CircularProgressIndicator();
    //     });
     return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            );
  }
}
