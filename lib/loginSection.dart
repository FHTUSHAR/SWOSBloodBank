import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'account.dart';

class LoginSection extends StatefulWidget {
  static String id='LoginSection';

  @override
  _LoginSectionState createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  String email = '';
  String password = '';
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(''
            'SWOS BLOOD BANK',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Satisfy',
              fontWeight: FontWeight.w500
          ),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 150.0,
              ),
              TextField(

                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: inputFiledDecoration(
                    'Enter your email'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: inputFiledDecoration('Enter your password'),
              ),

              SizedBox(
                height: 20.0,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)
                    ),
                    padding: EdgeInsets.all(10.0),
                  ),

                  onPressed: ()async {
                    await _auth.signInWithEmailAndPassword(email: email, password: password);
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                     return Account(email);
                   }));
                  },

                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 30.0,
                      fontFamily: 'Satisfy',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,


                    ),


                  )
              )

            ],
          ),
        ),
      ),
    );
  }

  InputDecoration inputFiledDecoration(String text) {
    return InputDecoration(
      hintText: text,
      contentPadding:
      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
    );
  }
}
