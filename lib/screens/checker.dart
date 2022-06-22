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
    'semester_1_subject_1',
    'semester_2_subject_1',
    'semester_3_subject_1',
    'semester_4_subject_1',
    'semester_5_subject_1',
    'semester_6_subject_1',
  ];
  String? selectedItem;

  List<String> items2 = [
    'DSS',
    'semester_1_subject_2',
    'semester_2_subject_2',
    'semester_3_subject_2',
    'semester_4_subject_2',
    'semester_5_subject_2',
    'semester_6_subject_2',
  ];
  String? selectedItem2;

  List<String> items3 = [
    'MC',
    'semester_1_subject_3',
    'semester_2_subject_3',
    'semester_3_subject_3',
    'semester_4_subject_3',
    'semester_5_subject_3',
    'semester_6_subject_3',
  ];
  String? selectedItem3;

  List<String> items4 = [
    'English',
    'semester_1_subject_4',
    'semester_2_subject_4',
    'semester_3_subject_4',
    'semester_4_subject_4',
    'semester_5_subject_4',
    'semester_6_subject_4',
  ];
  String? selectedItem4;

  List<String> items5 = [
    'GIS',
    'semester_1_subject_5',
    'semester_2_subject_5',
    'semester_3_subject_5',
    'semester_4_subject_5',
    'semester_5_subject_5',
    'semester_6_subject_5',
  ];
  String? selectedItem5;

  List<String> items5_failed = ['Software Engineering'];
  String? selectedItem5_failed;

  List<String> items6 = [
    'It Project Management',
    'semester_1_subject_6',
    'semester_2_subject_6',
    'semester_3_subject_6',
    'semester_4_subject_6',
    'semester_5_subject_6',
    'semester_6_subject_6',
  ];
  String? selectedItem6;

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
    _selectedItemIndicator(loggedInUser.current_semester);
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
                Text(
                    style: TextStyle(
                        color: Constant.color,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    'Hello ${loggedInUser.firstName} Are You Ready For Your Next Semester!'),
                SizedBox(
                  height: 10,
                ),
                Text(
                    style: TextStyle(
                        color: Constant.color,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    'Your Current Semester is Semester ${loggedInUser.current_semester}'),
                SizedBox(
                  height: 30,
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
                    child: (_subjectBlocker(
                      "${loggedInUser.semester_7?['software_engineering'] ?? 0}",
                    ))
                        ? DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    BorderSide(width: 3, color: Constant.color),
                              ),
                            ),
                            value: selectedItem5,
                            items: items5
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item,
                                          style: TextStyle(fontSize: 12)),
                                    ))
                                .toList(),
                            onChanged: (item) =>
                                setState(() => selectedItem5 = item),
                          )
                        : DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    BorderSide(width: 3, color: Constant.color),
                              ),
                            ),
                            value: selectedItem5_failed,
                            items: items5_failed
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item,
                                          style: TextStyle(fontSize: 12)),
                                    ))
                                .toList(),
                            onChanged: (item) =>
                                setState(() => selectedItem5 = item),
                            // focusColor: _item5getter(),
                          )),
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
                                _levelUp(loggedInUser.current_semester);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LevelUp()),
                                );
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

  _item5getter() {
    selectedItem5 = selectedItem5_failed;
  }

  _subjectBlocker(input) {
    if (input == null) {
      return "loading...";
    } else {
      if (double.tryParse(input)! >= 50) {
        return true;
      } else {
        return false;
      }
    }
  }

  _semester8assigning(input) {
    if (input == null) {
      return "loading...";
    } else {
      if (double.tryParse(loggedInUser.semester_7?['software_engineering'])! >=
          50) {
        return true;
      } else {
        return false;
      }
    }
  }

  _selectedItemIndicator(input) {
    if (input == null) {
      return "loading...";
    } else {
      if (input == "1") {
        selectedItem = "semester_2_subject_1";
        selectedItem2 = "semester_2_subject_2";
        selectedItem3 = "semester_2_subject_3";
        selectedItem4 = "semester_2_subject_4";
        selectedItem5 = "semester_2_subject_5";
        selectedItem6 = "semester_2_subject_6";
      } else if (input == "2") {
        selectedItem = "semester_3_subject_1";
        selectedItem2 = "semester_3_subject_2";
        selectedItem3 = "semester_3_subject_3";
        selectedItem4 = "semester_3_subject_4";
        selectedItem5 = "semester_3_subject_5";
        selectedItem6 = "semester_3_subject_6";
      } else if (loggedInUser.current_semester == "3") {
        selectedItem = "semester_4_subject_1";
        selectedItem2 = "semester_4_subject_2";
        selectedItem3 = "semester_4_subject_3";
        selectedItem4 = "semester_4_subject_4";
        selectedItem5 = "semester_4_subject_5";
        selectedItem6 = "semester_4_subject_6";
      } else if (loggedInUser.current_semester == "4") {
        selectedItem = "semester_5_subject_1";
        selectedItem2 = "semester_5_subject_2";
        selectedItem3 = "semester_5_subject_3";
        selectedItem4 = "semester_5_subject_4";
        selectedItem5 = "semester_5_subject_5";
        selectedItem6 = "semester_5_subject_6";
      } else if (loggedInUser.current_semester == "5") {
        final docUser = selectedItem = "semester_1_subject_1";
        selectedItem2 = "semester_6_subject_2";
        selectedItem3 = "semester_6_subject_3";
        selectedItem4 = "semester_6_subject_4";
        selectedItem5 = "semester_6_subject_5";
        selectedItem6 = "semester_6_subject_6";
      } else if (loggedInUser.current_semester == "6") {
        selectedItem = "semester_7_subject_1";
        selectedItem2 = "semester_7_subject_2";
        selectedItem3 = "semester_7_subject_3";
        selectedItem4 = "semester_7_subject_4";
        selectedItem5 = "semester_7_subject_5";
        selectedItem6 = "semester_7_subject_6";
      } else if (input == "7") {
        selectedItem = "semester_8_subject_1";
        selectedItem2 = "semester_8_subject_2";
        selectedItem3 = "semester_8_subject_3";
        selectedItem4 = "semester_8_subject_4";
        selectedItem5 = "semester_8_subject_5";
        selectedItem6 = "semester_8_subject_6";
      } else
        return Text(
            "there is probably an error in your database check with your advisor");
    }
  }

  _levelUp(input) {
    if (input == null) {
      return "loading...";
    } else {
      if (input == "1") {
        final docUser =
            FirebaseFirestore.instance.collection('users').doc(user!.uid);
        docUser.update({
          'semester_2.${selectedItem}': '',
          'semester_2.${selectedItem2}': '',
          'semester_2.${selectedItem3}': '',
          'semester_2.${selectedItem4}': '',
          'semester_2.${selectedItem5}': '',
          'semester_2.${selectedItem6}': '',
        });
      } else if (input == "2") {
        final docUser =
            FirebaseFirestore.instance.collection('users').doc(user!.uid);
        docUser.update({
          'semester_3.${selectedItem}': '',
          'semester_3.${selectedItem2}': '',
          'semester_3.${selectedItem3}': '',
          'semester_3.${selectedItem4}': '',
          'semester_3.${selectedItem5}': '',
          'semester_3.${selectedItem6}': '',
        });
      } else if (loggedInUser.current_semester == "3") {
        final docUser =
            FirebaseFirestore.instance.collection('users').doc(user!.uid);
        docUser.update({
          'semester_4.${selectedItem}': '',
          'semester_4.${selectedItem2}': '',
          'semester_4.${selectedItem3}': '',
          'semester_4.${selectedItem4}': '',
          'semester_4.${selectedItem5}': '',
          'semester_4.${selectedItem6}': '',
        });
      } else if (loggedInUser.current_semester == "4") {
        final docUser =
            FirebaseFirestore.instance.collection('users').doc(user!.uid);
        docUser.update({
          'semester_5.${selectedItem}': '',
          'semester_5.${selectedItem2}': '',
          'semester_5.${selectedItem3}': '',
          'semester_5.${selectedItem4}': '',
          'semester_5.${selectedItem5}': '',
          'semester_5.${selectedItem6}': '',
        });
      } else if (loggedInUser.current_semester == "5") {
        final docUser =
            FirebaseFirestore.instance.collection('users').doc(user!.uid);
        docUser.update({
          'semester_6.${selectedItem}': '',
          'semester_6.${selectedItem2}': '',
          'semester_6.${selectedItem3}': '',
          'semester_6.${selectedItem4}': '',
          'semester_6.${selectedItem5}': '',
          'semester_6.${selectedItem6}': '',
        });
      } else if (loggedInUser.current_semester == "6") {
        final docUser =
            FirebaseFirestore.instance.collection('users').doc(user!.uid);
        docUser.update({
          'semester_7.${selectedItem}': '',
          'semester_7.${selectedItem2}': '',
          'semester_7.${selectedItem3}': '',
          'semester_7.${selectedItem4}': '',
          'semester_7.${selectedItem5}': '',
          'semester_7.${selectedItem6}': '',
        });
      } else if (input == "7") {
        final docUser =
            FirebaseFirestore.instance.collection('users').doc(user!.uid);
        docUser.update({
          'semester_8.${selectedItem}': '',
          'semester_8.${selectedItem2}': '',
          'semester_8.${selectedItem3}': '',
          'semester_8.${selectedItem4}': '',
          'semester_8.${selectedItem5}': '',
          'semester_8.${selectedItem6}': '',
        });
      } else
        return Text(
            "there is probably an error in your database check with your advisor");
    }
  }
}
