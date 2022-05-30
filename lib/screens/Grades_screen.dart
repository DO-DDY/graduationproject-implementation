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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                  DataCell(Text('A')),
                  DataCell(Text('${loggedInUser.mc}')),
                ]),
                DataRow(cells: [
                  DataCell(Text('DSS')),
                  DataCell(Text('B')),
                  DataCell(Text('${loggedInUser.dss}')),
                ]),
                DataRow(cells: [
                  DataCell(Text('GIS')),
                  DataCell(Text('B')),
                  DataCell(Text('${loggedInUser.gis}')),
                ]),
                DataRow(cells: [
                  DataCell(Text('it project management')),
                  DataCell(Text('B')),
                  DataCell(Text('${loggedInUser.it_project_management}')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Data mining')),
                  DataCell(Text('B')),
                  DataCell(Text('${loggedInUser.data_mining}')),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> Grade_score(input) async {
    await input;
    if (double.tryParse(input)! < 50) {
      const Text('F');
    } else if (double.tryParse(input)! < 75) {
      print("B");
    } else {
      print("");
    }
  }
}
