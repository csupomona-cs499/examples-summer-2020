import 'package:example1/main.dart';
import 'package:flutter/material.dart';

class MyThirdPage extends StatefulWidget {
  MyThirdPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyThirdPageState createState() => _MyThirdPageState();
}

class _MyThirdPageState extends State<MyThirdPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      print("The counter has been increased to " + _counter.toString());
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(title: 'My Home Page')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'App Logo - Screen No. 3',
            ),
            Text(
              'My Demo App - Screen No. 3',
            ),
            Text(
              'Login First Please',
            ),
            Text(
              'You have pushed the button this many times!!!',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
