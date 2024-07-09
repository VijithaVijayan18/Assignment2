import 'package:flutter/foundation.dart';

class StudentModel {
  String firstName;
  String secondName;
  String address;
  String mobile;
  StudentModel(this.firstName, this.secondName, this.address, this.mobile);
  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "secondName": secondName,
      "address": address,
      "mobile": mobile,
    };
  }

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      json['firstName'],
      json['secondName'],
      json['address'],
      json['mobile'],
    );
  }
}