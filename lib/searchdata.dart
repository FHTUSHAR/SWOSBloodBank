import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchData extends StatefulWidget {
  static String id = 'SearchData';
  @override
  _SearchDataState createState() => _SearchDataState();
}

class _SearchDataState extends State<SearchData> {
  String blood = '';
  String address = '';
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Card(
          child: TextField(
            controller: _controller,

            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: _controller.clear,
                  icon: Icon(Icons.clear),
                ),
                hintText: 'Search by place name',
                prefix: Icon(Icons.search),
            ),
            onChanged: (val) {
               setState(() {
                address = val.toUpperCase();
               });
            },
          ),
        ),

      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: ( (address != "" && address != null))
            ? FirebaseFirestore.instance
                .collection('info')
                //.where("blood", isEqualTo: blood)
                .where("address",isEqualTo: address)
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
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Column(
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
                                          ),
                                          Expanded(
                                            child: Text(
                                              ' ${data['name']}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20,
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
                                        ),
                                        Text(
                                          ' ${data['number']}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
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
                                        ),
                                        Expanded(
                                          child: Text(
                                            ' ${data['address']}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
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
                                        Text("Donation Date :",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: Colors.red,
                                          ),),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          ' ${data['date']}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),

                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left:50.0 ),
                                  width: 16.0,

                                  child: Column(
                                    children: [
                                      Row(
                                        children: [

                                          Icon(
                                            Icons.bloodtype,
                                            color: Colors.red,
                                            size: 50.0,
                                          ),
                                          Text(
                                            ' ${data['blood']}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 35,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
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
                  },
                );
        },
      ),
    );
  }
}
