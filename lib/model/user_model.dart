class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? english;
  String? dss;
  String? mc;
  String? data_mining;
  String? gis;
  String? it_project_management;

  UserModel(
      {this.uid,
      this.email,
      this.firstName,
      this.secondName,
      this.english,
      this.dss,
      this.data_mining,
      this.gis,
      this.it_project_management,
      this.mc});

  //receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
      english: map['english'],
      dss: map['dss'],
      mc: map['mc'],
      data_mining: map['data_mining'],
      gis: map['gis'],
      it_project_management: map['it_project_management'],
    );
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
    };
  }
}
