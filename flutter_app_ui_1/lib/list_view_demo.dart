import 'package:flutter/material.dart';
import 'package:flutterappui1/friend_contact_details.dart';
import 'package:flutterappui1/friend_data.dart';

class ListViewDemoPage extends StatefulWidget {
  @override
  _ListViewDemoPageState createState() => _ListViewDemoPageState();
}

class _ListViewDemoPageState extends State<ListViewDemoPage> {

  final List<String> entries = <String>[
    'Alice', 'Ben', 'Thomas', 'Zach', 'John', 'Tom', 'Cindy', 'Frank', 'Hugo', 'James'];
  final List<String> phones = <String>[
    '909-000-0000', '909-000-0001', '909-000-0002', '909-000-0003', '909-000-0004', '909-000-0005', '909-000-0006', '909-000-0007', '909-000-0008', '909-000-0009'];

  var friendList = [
    {
      'name' : 'Alice',
      'phone' : '909-234-1234',
      'imageUrl' : 'https://www.shareicon.net/data/512x512/2016/09/15/829444_man_512x512.png',
      'type' : 'CELL'
    },
    {
      'name' : 'John',
      'phone' : '123-234-1234',
      'imageUrl' : 'https://www.clipartmax.com/png/middle/162-1623921_stewardess-510x510-user-profile-icon-png.png',
      'type' : 'WORK'
    },
    {
      'name' : 'Zach',
      'phone' : '909-234-4565',
      'imageUrl' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRogE7DKEaVrGYR_kobPtbBP6W8msiDtjNgs8t_LC-_XneM4SHc&usqp=CAU',
      'type' : 'HOME'
    }
  ];

  List<Friend> friends;

  _ListViewDemoPageState() {
    Friend f1 = Friend("Alice", "909-009-3434", "https://www.clipartmax.com/png/middle/162-1623921_stewardess-510x510-user-profile-icon-png.png", "HOME");
    Friend f2 = Friend("Ben", "909-232-3434", "https://www.shareicon.net/data/512x512/2016/09/15/829444_man_512x512.png", "WORK");
    Friend f3 = Friend("Zach", "123-009-3422", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSNngF0RFPjyGl4ybo78-XYxxeap88Nvsyj1_txm6L4eheH8ZBu&usqp=CAU", "CELL");
    Friend f4 = Friend("John", "405-009-1111", "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRogE7DKEaVrGYR_kobPtbBP6W8msiDtjNgs8t_LC-_XneM4SHc&usqp=CAU", "HOME");

    friends = [f1, f2, f3, f4];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: friendList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                print("The item is clicked " + index.toString());
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FriendContactDetailsPage(friendList[index])),
                );
              },
              title: Container(
                height: 50,
                margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('${friendList[index]['imageUrl']}'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            '${friendList[index]['name']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          '${friendList[index]['phone']}'
                        )
                      ],
                    ),
                    Spacer(),
                    Text('${friendList[index]['type']}')
                  ],
                ),
              ),
            );
          })
    );
  }
}
