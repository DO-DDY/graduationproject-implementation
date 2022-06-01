import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../config/constant.dart';
import '../model/user_model.dart';

class GradesScreen extends StatefulWidget {
  const GradesScreen({Key? key}) : super(key: key);

  @override
  _GradesScreenState createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {
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
        centerTitle: true,
        title: Text('Grades'),
      ),
      body: SafeArea(
        child: Column(
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
                    DataCell(Text('english')),
                    DataCell(Text('${gradeChecker(loggedInUser.english)}')),
                    DataCell(Text('${loggedInUser.english}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('MC')),
                    DataCell(Text('${gradeChecker(loggedInUser.mc)}')),
                    DataCell(Text('${loggedInUser.mc}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('DSS')),
                    DataCell(Text('${gradeChecker(loggedInUser.dss)}')),
                    DataCell(Text('${loggedInUser.dss}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('GIS')),
                    DataCell(Text('${gradeChecker(loggedInUser.gis)}')),
                    DataCell(Text('${loggedInUser.gis}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('IT')),
                    DataCell(Text(
                        '${gradeChecker(loggedInUser.it_project_management)}')),
                    DataCell(Text('${loggedInUser.it_project_management}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Data mining')),
                    DataCell(Text('${gradeChecker(loggedInUser.data_mining)}')),
                    DataCell(Text('${loggedInUser.data_mining}')),
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
                  onPressed: () {},
                ),
                SizedBox(
                  width: 45,
                ),
                ActionChip(
                  avatar: CircleAvatar(backgroundColor: Constant.color),
                  padding: EdgeInsets.all(5),
                  label: Text("semester 2"),
                  onPressed: () {},
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
                  onPressed: () {},
                ),
                SizedBox(
                  width: 45,
                ),
                ActionChip(
                  avatar: CircleAvatar(backgroundColor: Constant.color),
                  padding: EdgeInsets.all(5),
                  label: Text("semester 4"),
                  onPressed: () {},
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
                  onPressed: () {},
                ),
                SizedBox(
                  width: 45,
                ),
                ActionChip(
                  avatar: CircleAvatar(backgroundColor: Constant.color),
                  padding: EdgeInsets.all(5),
                  label: Text("semester 6"),
                  onPressed: () {},
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
                  onPressed: () {},
                ),
                SizedBox(
                  width: 45,
                ),
                ActionChip(
                  avatar: CircleAvatar(backgroundColor: Constant.color),
                  padding: EdgeInsets.all(5),
                  label: Text("semester 8"),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

gradeChecker(input) {
  if (double.tryParse(input)! < 100 && double.tryParse(input)! > 95) {
    return "A";
  } else if (double.tryParse(input)! < 95 && double.tryParse(input)! > 85) {
    return "B";
  } else if (double.tryParse(input)! < 85 && double.tryParse(input)! > 75) {
    return "C";
  } else if (double.tryParse(input)! < 75 && double.tryParse(input)! > 65) {
    return "D";
  } else if (double.tryParse(input)! < 65 && double.tryParse(input)! > 50) {
    return "E";
  } else if (double.tryParse(input)! < 50) {
    return "F";
  }
}
