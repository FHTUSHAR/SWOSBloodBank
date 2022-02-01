import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'donarsSection.dart';
import 'searchdata.dart';
import 'loginSection.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

//static String id='Home';
class Home extends StatefulWidget {
  static String id = 'Home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternet();

  }
  void checkInternet()async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("No Internet"),
              content: Text("Please check the internet connection"),
              actions: [
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                // margin: EdgeInsets.only(top: 50.0),
                height: 750,

                decoration: BoxDecoration(
                  color: Color(0xffb33939),
                  // borderRadius: BorderRadius.only(topLeft: Radius.circular(80.0)),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 50.0,
                      fontFamily: 'Satisfy',
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ScaleAnimatedText('SWOS Blood Bank'),
                        ScaleAnimatedText('Give Blood'),
                        ScaleAnimatedText('Save Life'),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 150.0),
                height: 600,
                decoration: BoxDecoration(
                  color: Color(0xffd1ccc0),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(120.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // SizedBox(
                      //   height: 10.0,
                      // ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)),

                          // padding:  EdgeInsets.all(30.0),
                          primary: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 50.0,
                            fontFamily: 'Satisfy',
                            // backgroundColor: Colors.red,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SearchData();
                          }));
                        },
                        child:
                            Text('Blood\n Search', textAlign: TextAlign.center),
                      ),

                      SizedBox(
                        height: 20.0,
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
                            fontSize: 50.0,
                            fontFamily: 'Satisfy',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DonarSection();
                          }));
                        },
                        child: Text(
                          'Donar\'s Registration',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
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
                            fontSize: 50.0,
                            fontFamily: 'Satisfy',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginSection();
                          }));
                        },
                        child: Text(
                          'Donar\'s Account',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
