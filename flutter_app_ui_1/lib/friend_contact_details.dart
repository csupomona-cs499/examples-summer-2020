import 'package:flutter/material.dart';

class FriendContactDetailsPage extends StatefulWidget {

  var contactDetails;

  FriendContactDetailsPage(this.contactDetails);

  @override
  _FriendContactDetailsPageState createState() => _FriendContactDetailsPageState();
}

class _FriendContactDetailsPageState extends State<FriendContactDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("${widget.contactDetails['name']}"),
          Text("${widget.contactDetails['phone']}"),
          Text("${widget.contactDetails['type']}"),
          Text("${widget.contactDetails['imageUrl']}"),
        ],
      ),
    );
  }
}
