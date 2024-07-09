import 'package:flutter/material.dart';
import 'package:sample_proj/Splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Navigation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
               
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                deletingLoggedData(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: MaterialButton(
            color: Colors.blue,
            
            onPressed: () {
              deletingLoggedData(context);
            },
            child: Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
            height: 50,
            minWidth: 150,
          ),
        ),
      ),
    );
  }

  void deletingLoggedData(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("User");
    prefs.remove("Pass");
    prefs.setString("Go", "0");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => splash()),
    );
  }
}
