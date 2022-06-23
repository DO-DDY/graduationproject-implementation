import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduationprojectyarb/model/user_model.dart';
import 'package:graduationprojectyarb/screens/Grades_screen.dart';
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
    'English 1',
    'English 2',
    'Money and banking',
    'Enterprise applications',
    'Data communication',
    'HCI',
    'Operating System',
    'Dss',
  ];
  String? selectedItem;

  List<String> items2 = [
    'Microeconomics',
    'Macroeconomics',
    'Statistics 2',
    'Discrete math',
    'TQM',
    'English 6',
    'AI',
    'English 8',
  ];
  String? selectedItem2;

  List<String> items3 = [
    'Math 1',
    'Statistics 1',
    'MIS',
    'Programming',
    'OR',
    'Business process modeling',
    'Software engineering',
    'Mobile computing',
  ];
  String? selectedItem3;

  List<String> items4 = [
    'Accounting 1',
    'Accounting 2',
    'Principle of marketing',
    'Scientific Research',
    'English 5',
    'International business',
    'Information storage',
    'IT project management',
  ];
  String? selectedItem4;

  List<String> items5 = [
    'IT',
    'OB',
    'English 3',
    'Principle of finance',
    'Cost accounting',
    'System analysis',
    'English 7',
    'Data mining',
  ];
  String? selectedItem5;

  List<String> items5_failed = ['Software Engineering'];
  String? selectedItem5_failed;

  List<String> items6 = [
    'Principle of management',
    'Translation',
    'Operation management',
    'English 4',
    'Data structure',
    'E-Commerce',
    'Strategic Management',
    'GIS',
  ];
  String? selectedItem6;

  List<String> items7 = [
    'Science And technology',
    'Business law',
    'Human resource management',
    'Data base',
    'Managerial Accounting',
  ];
  String? selectedItem7;

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
                    child: DropdownButtonFormField<String>(
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
                                child:
                                    Text(item, style: TextStyle(fontSize: 12)),
                              ))
                          .toList(),
                      onChanged: (item) => setState(() => selectedItem5 = item),
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
                    value: selectedItem7,
                    items: items7
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: TextStyle(fontSize: 12)),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() => selectedItem7 = item),
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
                              if (value != loggedInUser.serialCode) {
                                return ("Your Code Is Not Correct");
                              }
                              if (value == loggedInUser.serialCode) {
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
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _selectedItemIndicator(currentSemester) {
    if (currentSemester == null) {
      return "loading...";
    } else {
      if (currentSemester == "new") {
        selectedItem = _subjectValidator("English 1");
        selectedItem2 = _subjectValidator("Microeconomics");
        selectedItem3 = _subjectValidator("Math 1");
        selectedItem4 = _subjectValidator("Accounting 1");
        selectedItem5 = _subjectValidator("IT");
        selectedItem6 = _subjectValidator("Principle of management");
        selectedItem7 = _subjectValidator("Science And technology");
      } else if (currentSemester == "1") {
        selectedItem = _subjectValidator("English 2");
        selectedItem2 = _subjectValidator("Macroeconomics");
        selectedItem3 = _subjectValidator("Statistics 1");
        selectedItem4 = _subjectValidator("Accounting 2");
        selectedItem5 = _subjectValidator("OB");
        selectedItem6 = _subjectValidator("Translation");
      } else if (currentSemester == "2") {
        selectedItem = "Money and banking";
        selectedItem2 = _subjectValidator("Statistics 2");
        selectedItem3 = _subjectValidator("MIS");
        selectedItem4 = "Principle of marketing";
        selectedItem5 = _subjectValidator("English 3");
        selectedItem6 = "Operation management";
        selectedItem7 = "Business law";
      } else if (currentSemester == "3") {
        selectedItem = _subjectValidator("Enterprise applications");
        selectedItem2 = _subjectValidator("Discrete math");
        selectedItem3 = _subjectValidator("Programming");
        selectedItem4 = _subjectValidator("Scientific Research");
        selectedItem5 = "Principle of finance";
        selectedItem6 = _subjectValidator("English 4");
        selectedItem7 = _subjectValidator("Human resource management");
      } else if (currentSemester == "4") {
        selectedItem = _subjectValidator("Data communication");
        selectedItem2 = _subjectValidator("TQM");
        selectedItem3 = _subjectValidator("OR");
        selectedItem4 = _subjectValidator("English 5");
        selectedItem5 = _subjectValidator("Cost accounting");
        selectedItem6 = _subjectValidator("Data structure");
        selectedItem7 = _subjectValidator("Data base");
      } else if (currentSemester == "5") {
        selectedItem = "HCI";
        selectedItem2 = "English 6";
        selectedItem3 = "Business process modeling";
        selectedItem4 = "International business";
        selectedItem5 = "System analysis";
        selectedItem6 = "E-Commerce";
      } else if (currentSemester == "6") {
        selectedItem = "Operating System";
        selectedItem2 = "AI";
        selectedItem3 = "Software engineering";
        selectedItem4 = "Information storage";
        selectedItem5 = "English 7";
        selectedItem6 = "Strategic Management";
        selectedItem7 = "Managerial Accounting";
      } else if (currentSemester == "7") {
        selectedItem = "Dss";
        selectedItem2 = "English 8";
        selectedItem3 = "Mobile computing";
        selectedItem4 = "IT project management";
        selectedItem5 = "Data mining";
        selectedItem6 = "GIS";
      } else
        return Text(
            "there is probably an error in your database check with your advisor");
    }
  }

  _levelUp(currentSemester) {
    if (currentSemester == null) {
      return "loading...";
    } else {
      if (currentSemester == "new") {
        final docUser =
            FirebaseFirestore.instance.collection('users').doc(user!.uid);
        docUser.update({
          'semester_1.${selectedItem}': '0',
          'semester_1.${selectedItem2}': '0',
          'semester_1.${selectedItem3}': '0',
          'semester_1.${selectedItem4}': '0',
          'semester_1.${selectedItem5}': '0',
          'semester_1.${selectedItem6}': '0',
          'semester_1.${selectedItem7}': '0',
          'current_semester': '1',
        });
      } else if (currentSemester == "1") {
        final docUser =
            FirebaseFirestore.instance.collection('users').doc(user!.uid);
        docUser.update({
          'semester_2.${selectedItem}': '0',
          'semester_2.${selectedItem2}': '0',
          'semester_2.${selectedItem3}': '0',
          'semester_2.${selectedItem4}': '0',
          'semester_2.${selectedItem5}': '0',
          'semester_2.${selectedItem6}': '0',
          'semester_2.${selectedItem7}': '0',
          'current_semester': '2',
        });
      } else if (currentSemester == "2") {
        final docUser =
            FirebaseFirestore.instance.collection('users').doc(user!.uid);
        docUser.update({
          'semester_3.${selectedItem}': '0',
          'semester_3.${selectedItem2}': '0',
          'semester_3.${selectedItem3}': '0',
          'semester_3.${selectedItem4}': '0',
          'semester_3.${selectedItem5}': '0',
          'semester_3.${selectedItem6}': '0',
          'semester_3.${selectedItem7}': '0',
          'current_semester': '3',
        });
      } else if (currentSemester == "3") {
        final docUser =
            FirebaseFirestore.instance.collection('users').doc(user!.uid);
        docUser.update({
          'semester_4.${selectedItem}': '0',
          'semester_4.${selectedItem2}': '0',
          'semester_4.${selectedItem3}': '0',
          'semester_4.${selectedItem4}': '0',
          'semester_4.${selectedItem5}': '0',
          'semester_4.${selectedItem6}': '0',
          'semester_4.${selectedItem7}': '0',
          'current_semester': '4',
        });
      } else if (currentSemester == "4") {
        final docUser =
            FirebaseFirestore.instance.collection('users').doc(user!.uid);
        docUser.update({
          'semester_5.${selectedItem}': '0',
          'semester_5.${selectedItem2}': '0',
          'semester_5.${selectedItem3}': '0',
          'semester_5.${selectedItem4}': '0',
          'semester_5.${selectedItem5}': '0',
          'semester_5.${selectedItem6}': '0',
          'semester_5.${selectedItem7}': '0',
          'current_semester': '5',
        });
      } else if (currentSemester == "5") {
        final docUser =
            FirebaseFirestore.instance.collection('users').doc(user!.uid);
        docUser.update({
          'semester_6.${selectedItem}': '0',
          'semester_6.${selectedItem2}': '0',
          'semester_6.${selectedItem3}': '0',
          'semester_6.${selectedItem4}': '0',
          'semester_6.${selectedItem5}': '0',
          'semester_6.${selectedItem6}': '0',
          'semester_6.${selectedItem7}': '0',
          'current_semester': '6',
        });
      } else if (currentSemester == "6") {
        final docUser =
            FirebaseFirestore.instance.collection('users').doc(user!.uid);
        docUser.update({
          'semester_7.${selectedItem}': '0',
          'semester_7.${selectedItem2}': '0',
          'semester_7.${selectedItem3}': '0',
          'semester_7.${selectedItem4}': '0',
          'semester_7.${selectedItem5}': '0',
          'semester_7.${selectedItem6}': '0',
          'semester_7.${selectedItem7}': '0',
          'current_semester': '7',
        });
      } else if (currentSemester == "7") {
        final docUser =
            FirebaseFirestore.instance.collection('users').doc(user!.uid);
        docUser.update({
          'semester_8.${selectedItem}': '0',
          'semester_8.${selectedItem2}': '0',
          'semester_8.${selectedItem3}': '0',
          'semester_8.${selectedItem4}': '0',
          'semester_8.${selectedItem5}': '0',
          'semester_8.${selectedItem6}': '0',
          'semester_8.${selectedItem7}': '0',
          'current_semester': '8',
        });
      } else if (currentSemester == "8") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GradesScreen(),
          ),
        );
      } else {
        return const Text(
            "there is probably an error in your database check with your advisor");
      }
    }
  }

  _subjectValidator(subject) {
    if (subject == "English 2") {
      {
        if (double.tryParse(loggedInUser.semester_1?["English 1"])! >= 50) {
          String newSubject = "English 2";
          return newSubject;
        } else {
          String oldSubject = "English 1";
          return oldSubject;
        }
      }
    } else if (subject == "English 3") {
      {
        if (double.tryParse(loggedInUser.semester_2?["English 2"])! >= 50) {
          String newSubject = "English 3";
          return newSubject;
        } else {
          String oldSubject = "English 2";
          return oldSubject;
        }
      }
    } else if (subject == "English 4") {
      {
        if (double.tryParse(loggedInUser.semester_3?["English 3"])! >= 50) {
          String newSubject = "English 4";
          return newSubject;
        } else {
          String oldSubject = "English 3";
          return oldSubject;
        }
      }
    } else if (subject == "English 5") {
      {
        if (double.tryParse(loggedInUser.semester_4?["English 4"])! >= 50) {
          String newSubject = "English 5";
          return newSubject;
        } else {
          String oldSubject = "English 4";
          return oldSubject;
        }
      }
    } else if (subject == "English 6") {
      {
        if (double.tryParse(loggedInUser.semester_5?["English 5"])! >= 50) {
          String newSubject = "English 6";
          return newSubject;
        } else {
          String oldSubject = "English 5";
          return oldSubject;
        }
      }
    } else if (subject == "English 7") {
      {
        if (double.tryParse(loggedInUser.semester_6?["English 6"])! >= 50) {
          String newSubject = "English 7";
          return newSubject;
        } else {
          String oldSubject = "English 6";
          return oldSubject;
        }
      }
    } else if (subject == "English 8") {
      {
        if (double.tryParse(loggedInUser.semester_7?["English 7"])! >= 50) {
          String newSubject = "English 8";
          return newSubject;
        } else {
          String oldSubject = "English 7";
          return oldSubject;
        }
      }
    } else if (subject == "Cost accounting") {
      if (double.tryParse(loggedInUser.semester_2?["Accounting 2"])! >= 50) {
        String newSubject = "Cost accounting";
        return newSubject;
      } else {
        String oldSubject = "Accounting 2";
        return oldSubject;
      }
    } else if (subject == "Accounting 2") {
      if (double.tryParse(loggedInUser.semester_1?["Accounting 1"])! >= 50) {
        String newSubject = "Accounting 2";
        return newSubject;
      } else {
        String oldSubject = "Accounting 1";
        return oldSubject;
      }
    } else if (subject == "Macroeconomics") {
      {
        if (double.tryParse(loggedInUser.semester_1?["Microeconomics"])! >=
            50) {
          String newSubject = "Macroeconomics";
          return newSubject;
        } else {
          String oldSubject = "Microeconomics";
          return oldSubject;
        }
      }
    } else if (subject == "Dss") {
      if (double.tryParse(loggedInUser.semester_1?["Operating System"])! >=
          50) {
        String newSubject = "Dss";
        return newSubject;
      } else {
        String oldSubject = "Operating System";
        return oldSubject;
      }
    } else if (subject == "Operating System") {
      if (double.tryParse(loggedInUser.semester_2?["Statistics 1"])! >= 50) {
        String newSubject = "Operating System";
        return newSubject;
      } else {
        String oldSubject = "Statistics 1";
        return oldSubject;
      }
    } else if (subject == "Statistics 1") {
      if (double.tryParse(loggedInUser.semester_1?["Math 1"])! >= 50) {
        String newSubject = "Statistics 1";
        return newSubject;
      } else {
        String oldSubject = "Math 1";
        return oldSubject;
      }
    } else if (subject == "Discrete math") {
      if (double.tryParse(loggedInUser.semester_1?["Math 1"])! >= 50) {
        String newSubject = "Discrete math";
        return newSubject;
      } else {
        String oldSubject = "Math 1";
        return oldSubject;
      }
    } else if (subject == "Discrete math") {
      if (double.tryParse(loggedInUser.semester_1?["Math 1"])! >= 50) {
        String newSubject = "Discrete math";
        return newSubject;
      } else {
        String oldSubject = "Math 1";
        return oldSubject;
      }
    } else if (subject == "Software engineering") {
      if (double.tryParse(loggedInUser.semester_1?["MIS"])! >= 50) {
        String newSubject = "Software engineering";
        return newSubject;
      } else {
        String oldSubject = "MIS";
        return oldSubject;
      }
    } else if (subject == "HCI") {
      if (double.tryParse(loggedInUser.semester_1?["IT"])! >= 50) {
        String newSubject = "HCI";
        return newSubject;
      } else {
        String oldSubject = "IT";
        return oldSubject;
      }
    } else if (subject == "Data structure") {
      if (double.tryParse(loggedInUser.semester_1?["IT"])! >= 50) {
        String newSubject = "Data structure";
        return newSubject;
      } else {
        String oldSubject = "IT";
        return oldSubject;
      }
    } else if (subject == "Programming") {
      if (double.tryParse(loggedInUser.semester_1?["IT"])! >= 50) {
        String newSubject = "Programming";
        return newSubject;
      } else {
        String oldSubject = "IT";
        return oldSubject;
      }
    } else if (subject == "MIS") {
      if (double.tryParse(loggedInUser.semester_1?["IT"])! >= 50) {
        String newSubject = "MIS";
        return newSubject;
      } else {
        String oldSubject = "IT";
        return oldSubject;
      }
    } else if (subject == "Strategic Management") {
      if (double.tryParse(
              loggedInUser.semester_1?["Principle of management"])! >=
          50) {
        String newSubject = "Strategic Management";
        return newSubject;
      } else {
        String oldSubject = "Principle of management";
        return oldSubject;
      }
    } else if (subject == "International business") {
      if (double.tryParse(
              loggedInUser.semester_1?["Principle of management"])! >=
          50) {
        if (double.tryParse(loggedInUser.semester_1?["Math 1"])! >= 50) {
          String newSubject = "International business";
          return newSubject;
        } else {
          String oldSubject = "Math 1";
          return oldSubject;
        }
      } else {
        String oldSubject = "Principle of management";
        return oldSubject;
      }
    } else if (subject == "System analysis") {
      if (double.tryParse(loggedInUser.semester_1?["Data base"])! >= 50) {
        if (double.tryParse(loggedInUser.semester_1?["Math 1"])! >= 50) {
          String newSubject = "System analysis";
          return newSubject;
        } else {
          String oldSubject = "Math 1";
          return oldSubject;
        }
      } else {
        String oldSubject = "Data base";
        return oldSubject;
      }
    } else if (subject == "Operating System") {
      if (double.tryParse(loggedInUser.semester_1?["Data structure"])! >= 50) {
        if (double.tryParse(loggedInUser.semester_1?["MIS"])! >= 50) {
          String newSubject = "Operating System";
          return newSubject;
        } else {
          String oldSubject = "MIS";
          return oldSubject;
        }
      } else {
        String oldSubject = "Data structure";
        return oldSubject;
      }
    } else {
      return subject;
    }
  }
}
