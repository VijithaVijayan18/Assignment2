import 'package:flutter/material.dart';
class WatssApp extends StatelessWidget {
  const WatssApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:const Text("WattsApp",
       style: TextStyle(color: Colors.white),),
       actions:const [Icon(Icons.search,
       color: Colors.white)],
      
      ),
    );
  }
}