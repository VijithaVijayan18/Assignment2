
import 'package:flutter/material.dart';
import 'package:sample_proj/StudentHome.dart';
import 'package:sample_proj/functions.dart';
import 'package:sample_proj/studentView.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    String hardcodedUsername = "viji";
    String hardcodedPassword = "viji@123";
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/LinkedIn_2021.svg/2560px-LinkedIn_2021.svg.png",
              width: 150,
              height: 150),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: TextField(
              controller: usernameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                label: Text("Username"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.visibility),

                  // ElevatedButton(onPressed: (){}, child:Text("jerry")),
                  label: Text("Password")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: MaterialButton(
              color: Colors.blue,
              onPressed: ()async {
                if (hardcodedUsername == usernameController.text &&
                    hardcodedPassword == passwordController.text) {
                      //saveLogginData(usernameController.text, passwordController.text);
                      //retrievingData();
                      await saveLogginData(true);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentHome()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 3),
                    content: Row(
                      children: const [
                        Icon(Icons.check),
                        Text("Invalid Username or Password")
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
          )
        ],
      ),
    );
  }
}