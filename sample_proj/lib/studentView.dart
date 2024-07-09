import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sample_proj/functions.dart';
import 'package:sample_proj/studentModel.dart';

class studentList extends StatefulWidget {
  const studentList({super.key});

  @override
  State<studentList> createState() => _MystudentList();
}

class _MystudentList extends State<studentList> {
  StudentModel? student;
  
  @override
   void initState(){
    super.initState();
    _loadStudent();
   }
   Future<void> _loadStudent() async{
    StudentModel? getStudents= await getStudent();
    setState(() {
      student=getStudents;
    });
   }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details",
        style: TextStyle(color: Color.fromARGB(255, 116, 16, 230)),),
      ),
       body: student == null
            ? Center(
                child: Text("No Student Data"),
              )
            : Padding(
                padding: EdgeInsets.only(left: 200,right: 200),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('First Name : ${student!.firstName}'),
                   
                    Text('Last Name : ${student!.secondName}')
                  ,
                    Text('Address : ${student!.address}'),
                    
                    Text('Mobile Number : ${student!.mobile}')
                    
                  ],
                ),
              ));

    
  }
}