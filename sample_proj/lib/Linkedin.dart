import 'package:flutter/material.dart';
import 'package:sample_proj/Home.dart';
import 'package:sample_proj/functions.dart';
import 'package:sample_proj/wattsapp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    String hardcodedUsername = "user";
    String hardcodedPassword = "Password";

    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      // ignore: prefer_const_literals_to_create_immutables
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/LinkedIn_Logo.svg/1920px-LinkedIn_Logo.svg.png",
            width: 150,
            height: 70,
          ),
           Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Username",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: TextField(
              controller: passwordController,
              decoration:const InputDecoration(
                labelText: "Password",
                
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: MaterialButton(
              color: Colors.blue,
              onPressed: () {
               if(hardcodedUsername == usernameController.text && hardcodedPassword == passwordController.text)
                  {
                    deletingString(usernameController.text, passwordController.text);
                    retrievingData();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                  }
                  
              else{

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(duration: Duration(seconds: 3),
                content: Row(
                  children:  [
                    Icon(Icons.warning),
                    Text("Invalid Credentials !"),
                  ],
                ),
                ));
              }
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
              height: 50,
              minWidth: 200,
            ),
          ),
        ],
      ),
    );
  }

}
Future <void>deletingString(String a,String b)async{
  final SharedPreferences prefs =await SharedPreferences.getInstance();
  prefs.setString("User", a.toString());
  prefs.setString("Pass", b.toString());
  prefs.setString("Go", "1");
}
