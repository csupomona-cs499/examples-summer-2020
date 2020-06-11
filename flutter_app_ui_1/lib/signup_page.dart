import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterappui1/list_view_demo.dart';
import 'package:flutterappui1/user_profile.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 25,
            child: Image(
                image: NetworkImage('https://helpx.adobe.com/content/dam/help/en/indesign/how-to/add-placeholder-text/jcr_content/main-pars/image_790976538/add-placeholder-text-intro_1000x560.jpg'),
                fit: BoxFit.fill,
            ),
          ),
          
          Expanded(
            flex: 50,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                      'Signup',
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
                    height: 65,
                    width: 200,
                    margin: EdgeInsets.only(top: 5),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                      ),
                      child: Text("Signup"),
                      onPressed: () {
                        // 1. get the email and password typed
                        print(emailController.text);
                        print(passwordController.text);
                        // 2. send it to Firebase Auth
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: emailController.text, password: passwordController.text)
                            .then((value) {
                              print("Successfully signed up!");
                              Navigator.pop(context);
                            }).catchError((error) {
                              print("Failed to sign up!");
                              print(error.toString());
                            });

//                        Future<AuthResult> result = FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
//                        result.then((value) {
//                          print("Successfully signed up!");
//                        });
//                        result.catchError((error){
//                          print("Failed to sign up!");
//                          print(error.toString());
//                        });

//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder: (context) => ListViewDemoPage()),
//                        );
                      },
                    ),
                ),
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
    );
  }
}
