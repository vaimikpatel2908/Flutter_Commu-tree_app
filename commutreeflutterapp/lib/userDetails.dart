import 'package:commutreeflutterapp/dbhelper.dart';
import 'package:commutreeflutterapp/models/Person.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatefulWidget {
  final int userId;
  UserDetailsPage({Key key, @required this.userId}) : super(key: key);


  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
 final dbHelper = DBHelper.dbhelper;

  Future<Person> getUserData(String userId) async {
    Person user = await dbHelper.getDataByUserId(int.parse(userId));

    if (user != null) {
      return user;
    } else {
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: getUserData('${widget.userId}'),
        builder: (BuildContext context, AsyncSnapshot usersData) {
          return usersData.hasData
              ? Scaffold(
                  appBar: AppBar(
                    leading: Icon(Icons.person,color: Colors.white,size: 40.0,),
                    title: Text("User Profile",style: TextStyle(color: Colors.white70,fontSize: 25.0)),
                    backgroundColor: Colors.blue.shade900,
                  ),
                  body: Center(child: Text("UserId ${widget.userId}")),
                  backgroundColor: Colors.grey.shade100,
                )
              : new Center(
                  child: new SizedBox(
                  child: new CircularProgressIndicator(),
                  width: 100.0,
                  height: 100.0,
                ),
                );
        });
  }
}
