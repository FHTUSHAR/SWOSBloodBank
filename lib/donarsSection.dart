import 'package:flutter/material.dart';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DonarSection extends StatefulWidget {
static String id="DonarSection";
  @override
  _DonarSectionState createState() => _DonarSectionState();
}

class _DonarSectionState extends State<DonarSection > {
  final _auth=FirebaseAuth.instance;
  String blood='';
  String name='';
  String address='';
  String mobile='';
  String email = '';
  String password = '';
  String date="";


  @override
 //
  FirebaseFirestore _users=  FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'SWOS Blood Bank',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Satisfy',
            fontWeight: FontWeight.w500
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              TextField(

                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  name = value.toUpperCase();
                },
                decoration: inputFiledDecoration('Enter your name(use 12 character or less)'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  blood = value.toUpperCase();
                },
                decoration: inputFiledDecoration('Enter blood group \'( )+\' '),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  mobile = value;
                },
                decoration: inputFiledDecoration('Enter your mobile number'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  address = value.toUpperCase();
                },
                decoration: inputFiledDecoration('Enter your address'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  date= value;
                },
                decoration: inputFiledDecoration('Blood donation date(DD/MM/YY)'),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email= value;
                },
                decoration: inputFiledDecoration('Enter your email'),
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
                   try{
                     final newUser=await _auth.createUserWithEmailAndPassword(email: email, password: password);
                   }
                   catch(e){
                     print(e);
                  }
                   _users.collection('info').add({
                     'name':name,
                     'blood':blood,
                     'number':mobile,
                     'address':address,
                     'email':email,
                     'date':date,
                   });
                   Widget okButton = TextButton(
                     child: Text("OK"),
                     onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context){
                         return Home();
                       }));
                     },
                   );
                   // set up the AlertDialog
                   AlertDialog alert = AlertDialog(
                     title: Text("Thank you"),
                     content: Text("For your service"),
                     actions: [
                       okButton,
                     ],

                   );

                   showDialog(
                     context: context,
                     builder: (BuildContext context) {
                       return alert;
                     },
                   );


                },

                    child:Text(
                      'Insert Data',
                      style:  TextStyle( fontSize: 30.0,
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
    InputDecoration inputFiledDecoration( String text) {
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

