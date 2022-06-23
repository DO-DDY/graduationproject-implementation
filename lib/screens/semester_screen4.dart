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

class SemesterScreen4 extends StatefulWidget {
  const SemesterScreen4({Key? key}) : super(key: key);

  @override
  _SemesterScreen4State createState() => _SemesterScreen4State();
}

class _SemesterScreen4State extends State<SemesterScreen4> {
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
        title: Text('Semester 4'),
      ),
      body: SafeArea(
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
                        DataCell(Text('Enterprise applications')),
                        DataCell(Text(
                            /*'${gradeChecker(loggedInUser.)}'*/ '${gradeChecker(loggedInUser.semester_4?["Enterprise applications"])}')),
                        DataCell(Text(
                            '${loggedInUser.semester_4?["Enterprise applications"]}')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Discrete math')),
                        DataCell(Text(
                            /*'${gradeChecker(loggedInUser.)}'*/ '${gradeChecker(loggedInUser.semester_4?["Discrete math"])}')),
                        DataCell(Text(
                            '${loggedInUser.semester_4?["Discrete math"]}')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Programming')),
                        DataCell(Text(
                            /*'${gradeChecker(loggedInUser.)}'*/ '${gradeChecker(loggedInUser.semester_4?["Programming"])}')),
                        DataCell(
                            Text('${loggedInUser.semester_4?["Programming"]}')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Scientific Research')),
                        DataCell(Text(
                            /*'${gradeChecker(loggedInUser.)}'*/ '${gradeChecker(loggedInUser.semester_4?["Scientific Research"])}')),
                        DataCell(Text(
                            '${loggedInUser.semester_4?['Scientific Research']}')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Principle of finance')),
                        DataCell(Text(
                            /*'${gradeChecker(loggedInUser.)}'*/ '${gradeChecker(loggedInUser.semester_4?["Principle of finance"])}')),
                        DataCell(Text(
                            '${loggedInUser.semester_4?["Principle of finance"]}')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('English 4')),
                        DataCell(Text(
                            /*'${gradeChecker(loggedInUser.)}'*/ '${gradeChecker(loggedInUser.semester_4?["English 4"])}')),
                        DataCell(Text(
                            /*'${loggedInUser.}'*/ '${loggedInUser.semester_4?["English 4"]}')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Human resource management')),
                        DataCell(Text(
                            /*'${gradeChecker(loggedInUser.)}'*/ '${gradeChecker(loggedInUser.semester_4?["Human resource management"])}')),
                        DataCell(Text(
                            /*'${loggedInUser.}'*/ '${loggedInUser.semester_4?["Human resource management"]}')),
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
    );
  }
}

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
