// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Login());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FutureBuilder(
            future: Firebase.initializeApp(),
            builder: (context, snapshot) {
              return Login();
            }));
  }
}
