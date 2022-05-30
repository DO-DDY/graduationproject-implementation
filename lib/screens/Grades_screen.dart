import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
                    DataCell(Text('${Grade_score(loggedInUser.english)}')),
                    DataCell(Text('${loggedInUser.english}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('MC')),
                    DataCell(Text('${Grade_score(loggedInUser.mc)}')),
                    DataCell(Text('${loggedInUser.mc}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('DSS')),
                    DataCell(Text('${Grade_score(loggedInUser.dss)}')),
                    DataCell(Text('${loggedInUser.dss}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('GIS')),
                    DataCell(Text('${Grade_score(loggedInUser.gis)}')),
                    DataCell(Text('${loggedInUser.gis}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('IT')),
                    DataCell(Text(
                        '${Grade_score(loggedInUser.it_project_management)}')),
                    DataCell(Text('${loggedInUser.it_project_management}')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Data mining')),
                    DataCell(Text('${Grade_score(loggedInUser.data_mining)}')),
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
                  padding: EdgeInsets.all(5),
                  label: Text("semester 1"),
                  onPressed: () {},
                ),
                ActionChip(
                  padding: EdgeInsets.all(5),
                  label: Text("semester 2"),
                  onPressed: () {},
                ),
                ActionChip(
                  padding: EdgeInsets.all(5),
                  label: Text("semester 3"),
                  onPressed: () {},
                ),
                ActionChip(
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
                  padding: EdgeInsets.all(5),
                  label: Text("semester 5"),
                  onPressed: () {},
                ),
                ActionChip(
                  padding: EdgeInsets.all(5),
                  label: Text("semester 6"),
                  onPressed: () {},
                ),
                ActionChip(
                  padding: EdgeInsets.all(5),
                  label: Text("semester 7"),
                  onPressed: () {},
                ),
                ActionChip(
                  padding: EdgeInsets.all(5),
                  label: Text("semester 8"),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Grade_score(input) {
  if (double.parse(input) > 95) {
    return "A";
  } else if (double.parse(input) < 95 && double.parse(input) > 85) {
    return "B";
  } else if (double.parse(input) < 85 && double.parse(input) > 75) {
    return "C";
  } else if (double.parse(input) < 75 && double.parse(input) > 65) {
    return "D";
  } else if (double.parse(input) < 65 && double.parse(input) > 50) {
    return "E";
  } else if (double.parse(input) < 50) {
    return "F";
  } else
    return null;
}
