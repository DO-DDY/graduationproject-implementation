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
  String? semester8code;
  Map? semester_1;
  Map? semester_7;
  Map? semester_8;

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
      this.mc,
      this.semester8code,
      this.semester_1,
      this.semester_7,
      this.semester_8});

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
        semester8code: map['semester8code'],
        semester_1: map['semester_1'],
        semester_7: map['semester_7'],
        semester_8: map['semester_8']);
  }

  //sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'semester_1': semester_1,
      'semester_8': semester_8
    };
  }
}
