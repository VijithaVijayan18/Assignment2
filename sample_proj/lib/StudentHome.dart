import 'package:flutter/material.dart';
import 'package:sample_proj/functions.dart';
import 'package:sample_proj/studentModel.dart';
import 'package:sample_proj/studentView.dart';


class StudentHome extends StatefulWidget {
  const StudentHome({super.key});
  @override
  State<StudentHome> createState() => _LoginPageState();
}

class _LoginPageState extends State<StudentHome> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Registration"),
      ),
// ignore: prefer_const_literals_to_create_immutables
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: firstNameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(hintText: "First Name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: secondNameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(hintText: "Second Name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: addressController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(hintText: "Address"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: mobileController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Enter Mobile Number"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 200,right: 200),
            child: ElevatedButton(
                onPressed: () {
                  StudentModel studReg = StudentModel(
                    firstNameController.text,
                    secondNameController.text,
                    addressController.text,
                    mobileController.text,
                  );
                  addStudent(studReg);
                  setState(() {
                    firstNameController.clear();
                    secondNameController.clear();
                    addressController.clear();
                    mobileController.clear();
                  });
                },
                child: Text("Register",
                 style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 17, 14, 192)
              
              )
            ),
                ),
          ),
          Padding(padding: EdgeInsets.only(top:20,left: 200,right: 200),
          child: ElevatedButton(
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>studentList()));
            },
            child: Text(
               "Student Details",
            style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 16, 9, 121)
              
              )
            ),
            ),)
        ],
      ),
    );
  }
}