import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduationprojectyarb/model/user_model.dart';
import 'package:graduationprojectyarb/screens/Level_Up.dart';

import '../config/constant.dart';

class Checker extends StatefulWidget {
  const Checker({Key? key}) : super(key: key);

  @override
  State<Checker> createState() => _CheckerState();
}

class _CheckerState extends State<Checker> {
  final _formKey = GlobalKey<FormState>();
  late String myCode;
  // form key
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  List<String> items = [
    'Data Mining',
    'DSS',
    'MC',
    'English',
    'GIS',
    'It Project Management'
  ];
  String? selectedItem = 'Data Mining';

  List<String> items2 = [
    'Data Mining',
    'DSS',
    'MC',
    'English',
    'GIS',
    'It Project Management'
  ];
  String? selectedItem2 = 'DSS';

  List<String> items3 = [
    'Data Mining',
    'DSS',
    'MC',
    'English',
    'GIS',
    'It Project Management'
  ];
  String? selectedItem3 = 'MC';

  List<String> items4 = [
    'Data Mining',
    'DSS',
    'MC',
    'English',
    'GIS',
    'It Project Management'
  ];
  String? selectedItem4 = 'English';

  List<String> items5 = [
    'Data Mining',
    'DSS',
    'MC',
    'English',
    'GIS',
    'It Project Management'
  ];
  String? selectedItem5 = 'GIS';

  List<String> items6 = [
    'Data Mining',
    'DSS',
    'MC',
    'English',
    'GIS',
    'It Project Management'
  ];
  String? selectedItem6 = 'It Project Management';

  @override
  Widget build(BuildContext context) {
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      color: Constant.color,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          print("text from button is" + myCode);
        },
        child: Text(
          "Level Up!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("choose your Subjects"),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  child: Image.asset("assets/logo.png", fit: BoxFit.contain),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 3, color: Constant.color),
                      ),
                    ),
                    value: selectedItem,
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: TextStyle(fontSize: 12)),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() => selectedItem = item),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 3, color: Constant.color),
                      ),
                    ),
                    value: selectedItem2,
                    items: items2
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: TextStyle(fontSize: 12)),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() => selectedItem2 = item),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 3, color: Constant.color),
                      ),
                    ),
                    value: selectedItem3,
                    items: items3
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: TextStyle(fontSize: 12)),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() => selectedItem3 = item),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 3, color: Constant.color),
                      ),
                    ),
                    value: selectedItem4,
                    items: items4
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: TextStyle(fontSize: 12)),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() => selectedItem4 = item),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 3, color: Constant.color),
                      ),
                    ),
                    value: selectedItem5,
                    items: items5
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: TextStyle(fontSize: 12)),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() => selectedItem5 = item),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 3, color: Constant.color),
                      ),
                    ),
                    value: selectedItem6,
                    items: items6
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: TextStyle(fontSize: 12)),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() => selectedItem6 = item),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return ("Please Enter Your Code");
                              }
                              //verify with the database
                              if (value != loggedInUser.semester8code) {
                                return ("Your Code Is Not Correct");
                              }
                              if (value == loggedInUser.semester8code) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LevelUp()),
                                );
                                return ("Your Code Has Been Verified");
                              }
                              return null;
                            },
                            onSaved: (value) {
                              myCode = value!;
                            },
                            decoration: InputDecoration(
                                hintText: "Enter your serial Code"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {}
                              },
                              child: const Text('Level Up!'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
