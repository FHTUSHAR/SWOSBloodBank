import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';

class Account extends StatefulWidget {
  static String id='Account';
   String email='';
  Account(this.email);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String number='';
  String address='';
  String date='';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:Text(''
            'Account',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Satisfy',
              fontWeight: FontWeight.w500
          ),),
      ),
      body:  StreamBuilder<QuerySnapshot>(
        stream: ( (widget.email != "" && widget.email != null))
            ? FirebaseFirestore.instance
            .collection('info')
        //.where("blood", isEqualTo: blood)
            .where("email",isEqualTo: widget.email)
            .snapshots()
            : FirebaseFirestore.instance.collection("info").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot data = snapshot.data!.docs[index];
              return Card(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(

                          child: Column(

                            children: [

                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.person,
                                    size: 30.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      ' ${data['name']}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 15,
                              ),

                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.call,
                                    size: 28.0,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            ' ${data['number']}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: IconButton(onPressed: (){
                                            Widget okButton = TextButton(
                                              child: Text("update"),
                                              onPressed: (){
                                                snapshot.data!.docs[index].reference.update(
                                                    {'number':number}).whenComplete(() => Navigator.pop(context));
                                              },
                                            );
                                            // set up the AlertDialog
                                            AlertDialog alert = AlertDialog(
                                              title: Text("Update your number"),
                                              content:  TextField(
                                                textAlign: TextAlign.center,
                                                onChanged: (value) {
                                                  //Do something with the user input.
                                                  number = value;

                                                },
                                                //decoration: inputFiledDecoration('Enter your password'),
                                              ),
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
                                          }, icon: Icon(Icons.edit,
                                            size: 30.0,
                                          color: Colors.lightBlue,)
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.home,
                                    size: 28.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      ' ${data['address']}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: IconButton(onPressed: (){
                                      Widget okButton = TextButton(
                                        child: Text("update"),
                                        onPressed: () {
                                          snapshot.data!.docs[index].reference.update(
                                              {'address':address}).whenComplete(() => Navigator.pop(context));
                                        },
                                      );
                                      // set up the AlertDialog
                                      AlertDialog alert = AlertDialog(
                                        title: Text("Update your address"),
                                        content: TextField(
                                          textAlign: TextAlign.center,
                                          onChanged: (value) {
                                            //Do something with the user input.
                                            address = value.toUpperCase();
                                          },
                                          //decoration: inputFiledDecoration('Enter your password'),
                                        ),
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
                                    }, icon: Icon(Icons.edit,
                                      size: 30.0,
                                      color: Colors.lightBlue,)
                                    ),
                                  )
                                  
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),

                                  Icon(
                                    Icons.bloodtype,
                                    color: Colors.red,
                                    size: 30.0,
                                  ),
                                  Text(
                                    ' ${data['blood']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 28,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Donation Date :',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.red,
                                    ),),
                                  SizedBox(
                                    width: 5,
                                  ),

                                  Expanded(
                                    child: Text(
                                      ' ${data['date']}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: IconButton(onPressed: (){
                                      Widget okButton = TextButton(
                                        child: Text("update"),
                                        onPressed: () {
                                          snapshot.data!.docs[index].reference.update(
                                              {'date':date}).whenComplete(() => Navigator.pop(context));
                                        },
                                      );
                                      // set up the AlertDialog
                                      AlertDialog alert = AlertDialog(
                                        title: Text("Update donation date"),
                                        content: TextField(
                                          textAlign: TextAlign.center,
                                          onChanged: (value) {
                                            //Do something with the user input.
                                            date = value.toUpperCase();
                                          },
                                          //decoration: inputFiledDecoration('Enter your password'),
                                        ),
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
                                    }, icon: Icon(Icons.edit,
                                      size: 30.0,
                                      color: Colors.lightBlue,)
                                    ),
                                  )

                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)),

                          // padding:  EdgeInsets.all(30.0),
                          primary: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Satisfy',
                            // backgroundColor: Colors.red,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onPressed: (){
                      Future<void> _signOut() async {
                        await FirebaseAuth.instance.signOut();
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return Home();
                          }));
                    }, child: Text('Log Out',))
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

