import 'dart:convert';

import 'package:sample_proj/studentModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future <void> saveLogginData(bool isuserloggedin) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("isloggedin", isuserloggedin);

}

// void retrievingData() async{
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   final String? name = prefs.getString("isloggedin");
//   print(name);
// }

Future<bool> retrievingData() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? data = prefs.getBool("isloggedin");
  if(data==null){
   data=false;
  }
  return data;
}

Future<void> deletingLoggedData()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove("isloggedin");
}
Future <void> addStudent(StudentModel studentModel) async {
final prefs = await SharedPreferences.getInstance();
String? jsonString =jsonEncode(studentModel.toJson());
print(jsonString);
await prefs.setString("studentData", jsonString);

}
Future<StudentModel?> getStudent() async{
  final prefs =await SharedPreferences.getInstance();
  String? jsonString =prefs.getString("studentData");
  if (jsonString!= null){
    Map<String,dynamic> jsonMap =jsonDecode(jsonString);
    return StudentModel.fromJson(jsonMap);
  }
  return null;
}