import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:graduationprojectyarb/screens/config/storage_service.dart';
import 'package:image_picker/image_picker.dart';

class LevelUp extends StatefulWidget {
  const LevelUp({Key? key}) : super(key: key);

  @override
  _LevelUpState createState() => _LevelUpState();
}

class _LevelUpState extends State<LevelUp> {
  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Schedule'),
      ),
      body: Column(
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
                  return CircularProgressIndicator();
                }
                return Container();
              })
        ],
      ),
    );
  }
}
