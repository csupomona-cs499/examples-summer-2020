import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterappui1/list_view_demo.dart';
import 'package:flutterappui1/signup_page.dart';
import 'package:flutterappui1/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'list_view_fb_demo.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Column(
            children: [
              Expanded(
                flex: 40,
                child: Image(
                    image: NetworkImage('https://helpx.adobe.com/content/dam/help/en/indesign/how-to/add-placeholder-text/jcr_content/main-pars/image_790976538/add-placeholder-text-intro_1000x560.jpg'),
                    fit: BoxFit.cover,
                ),
              ),

              Expanded(
                flex: 50,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35, bottom: 10, top: 10),
                      child: TextField(
                        controller: emailController,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 10),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.red
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5),
                        width: 200,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)
                          ),
                          child: Text("Login"),
                          onPressed: () {
                            FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: emailController.text, password: passwordController.text)
                            .then((value) {
                              print("Login successfully!");
                              // persist the status in the local device
                              SharedPreferences.getInstance().then((pref) {
                                pref.setBool("login", true);
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ListViewFirebaseDemoPage()),
                              );
                            }).catchError((error) {
                              print("Failed to login!");
                              print(error.toString());

                              SharedPreferences.getInstance().then((pref) {
                                pref.setBool("login", false);
                              });
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.only(top: 5),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)
                          ),
                          child: Text("Signup"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignupPage()),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),

              Expanded(
                flex: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                          'App Logo'
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.book),
                      onPressed: () {

                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.computer),
                      onPressed: (){

                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
