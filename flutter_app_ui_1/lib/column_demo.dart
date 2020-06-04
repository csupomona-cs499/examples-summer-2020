import 'package:flutter/material.dart';

class ColumnDemoPage extends StatefulWidget {
  @override
  _ColumnDemoPageState createState() => _ColumnDemoPageState();
}

class _ColumnDemoPageState extends State<ColumnDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column Demo')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 20,
              child: Text("Title 1"),
            ),
            Expanded(
              flex: 25,
              child: Container(
                  alignment: Alignment.center,
                  child: Text("Title 2")
              ),
            ),
            Expanded(
              flex: 20,
              child: Text("Title 3"),
            ),

            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    child: Text('Login'),
                    onPressed: () {

                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    child: Text('Signup'),
                    onPressed: () {

                    },
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
