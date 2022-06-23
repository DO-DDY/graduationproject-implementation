import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduationprojectyarb/screens/Grades_screen.dart';
import 'package:graduationprojectyarb/screens/semester_screen.dart';
import 'package:graduationprojectyarb/screens/semester_screen2.dart';
import 'package:graduationprojectyarb/screens/semester_screen3.dart';
import 'package:graduationprojectyarb/screens/semester_screen4.dart';
import 'package:graduationprojectyarb/screens/semester_screen5.dart';
import 'package:graduationprojectyarb/screens/semester_screen6.dart';
import 'package:graduationprojectyarb/screens/semester_screen7.dart';
import '../config/constant.dart';
import '../model/user_model.dart';
import 'home_screen.dart';

class SemesterScreen6 extends StatefulWidget {
  const SemesterScreen6({Key? key}) : super(key: key);

  @override
  _SemesterScreen6State createState() => _SemesterScreen6State();
}

class _SemesterScreen6State extends State<SemesterScreen6> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Semester 6'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Subject')),
                        DataColumn(label: Text('Score')),
                        DataColumn(label: Text('Grade')),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('E-Commerce')),
                          DataCell(Text(
                              '${gradeChecker(loggedInUser.semester_6?['E-Commerce'])}')),
                          DataCell(Text(
                              '${loggedInUser.semester_6?["E-Commerce"]}')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('HCI')),
                          DataCell(Text(
                              '${gradeChecker(loggedInUser.semester_6?['HCI'])}')),
                          DataCell(Text('${loggedInUser.semester_6?["HCI"]}')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('English 6')),
                          DataCell(Text(
                              '${gradeChecker(loggedInUser.semester_6?['English 6'])}')),
                          DataCell(
                              Text('${loggedInUser.semester_6?["English 6"]}')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Business process modeling')),
                          DataCell(Text(
                              '${gradeChecker(loggedInUser.semester_6?['Business process modeling'])}')),
                          DataCell(Text(
                              '${loggedInUser.semester_6?['Business process modeling']}')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('International business')),
                          DataCell(Text(
                              '${gradeChecker(loggedInUser.semester_6?['International business'])}')),
                          DataCell(Text(
                              '${loggedInUser.semester_6?["International business"]}')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('System analysis')),
                          DataCell(Text(
                              '${gradeChecker(loggedInUser.semester_6?['System analysis'])}')),
                          DataCell(Text(
                              /*'${loggedInUser.}'*/ '${loggedInUser.semester_6?["System analysis"]}')),
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ActionChip(
                        avatar: CircleAvatar(backgroundColor: Constant.color),
                        padding: EdgeInsets.all(5),
                        label: Text("semester 1"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SemesterScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 45,
                      ),
                      ActionChip(
                        avatar: CircleAvatar(backgroundColor: Constant.color),
                        padding: EdgeInsets.all(5),
                        label: Text("semester 2"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SemesterScreen2(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActionChip(
                        avatar: CircleAvatar(backgroundColor: Constant.color),
                        padding: EdgeInsets.all(5),
                        label: Text("semester 3"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SemesterScreen3(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 45,
                      ),
                      ActionChip(
                        avatar: CircleAvatar(backgroundColor: Constant.color),
                        padding: EdgeInsets.all(5),
                        label: Text("semester 4"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SemesterScreen4(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ActionChip(
                        avatar: CircleAvatar(backgroundColor: Constant.color),
                        padding: EdgeInsets.all(5),
                        label: Text("semester 5"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SemesterScreen5(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 45,
                      ),
                      ActionChip(
                        avatar: CircleAvatar(backgroundColor: Constant.color),
                        padding: EdgeInsets.all(5),
                        label: Text("semester 6"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SemesterScreen6(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActionChip(
                        avatar: CircleAvatar(backgroundColor: Constant.color),
                        padding: EdgeInsets.all(5),
                        label: Text("semester 7"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SemesterScreen7(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 45,
                      ),
                      ActionChip(
                        avatar: CircleAvatar(backgroundColor: Constant.color),
                        padding: EdgeInsets.all(5),
                        label: Text("semester 8"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GradesScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.90,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: const Text('Home Screen'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Grades Function
//Grades Function
gradeChecker<Map>(input) {
  if (input == null) {
    return 'loading...';
  } else {
    if (double.tryParse(input)! <= 100 && double.tryParse(input)! >= 95) {
      return "A";
    } else if (double.tryParse(input)! < 95 && double.tryParse(input)! >= 85) {
      return "B";
    } else if (double.tryParse(input)! < 85 && double.tryParse(input)! >= 75) {
      return "C";
    } else if (double.tryParse(input)! < 75 && double.tryParse(input)! >= 65) {
      return "D";
    } else if (double.tryParse(input)! < 65 && double.tryParse(input)! >= 50) {
      return "E";
    } else if (double.tryParse(input)! < 50) {
      return "F";
    }
  }
}
