import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home.dart';


//Solving firebase initialization problem
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SwosBloodBank ());
}

class SwosBloodBank extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner:false ,
      theme: ThemeData.light(),

      initialRoute:Home.id,
      routes: {
        Home.id:(context)=>Home(),

      },
    );
  }
}
