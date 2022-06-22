import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:graduationprojectyarb/model/user_model.dart';
import 'package:graduationprojectyarb/screens/config/storage_service.dart';
import 'package:image_picker/image_picker.dart';

import '../config/constant.dart';

class LevelUp extends StatefulWidget {
  const LevelUp({Key? key}) : super(key: key);

  @override
  _LevelUpState createState() => _LevelUpState();
}

class _LevelUpState extends State<LevelUp> {
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
    final Storage storage = Storage();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Schedule'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: storage.downloadURL('gdwal.jpg'),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Container(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: Image.network(
                    snapshot.data!,
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: CircularProgressIndicator(
                        color: Constant.color,
                      ),
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
          Text(
              style:
                  TextStyle(color: Constant.color, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              'Congratulation You Have Successfully Assigned the Following Subjects'),
          SizedBox(
            height: 2,
          ),
          Text(
              style: TextStyle(
                  color: Constant.color, fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
              '${loggedInUser.semester_8}')
        ],
      ),
    );
  }
}
