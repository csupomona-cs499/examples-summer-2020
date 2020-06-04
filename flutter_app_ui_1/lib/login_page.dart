import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    margin: EdgeInsets.only(top: 30, bottom: 30),
                    width: 200,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)
                      ),
                      child: Text("Login"),
                      onPressed: () {

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
    );
  }
}
