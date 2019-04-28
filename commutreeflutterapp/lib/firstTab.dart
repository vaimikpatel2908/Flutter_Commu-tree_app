import 'package:flutter/material.dart';
import './dbhelper.dart';
import './models/Person.dart';
import './userDetails.dart';

class FirstTab extends StatefulWidget {
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  final DBHelper dbHelper = DBHelper.dbhelper;

  Future<List<Person>> getAllUsers() async {
    try {
      int userId = await dbHelper.getSharedPreferences("userId");
      List<Person> listOfUsers =
          await dbHelper.selectAllUsers(int.tryParse(userId.toString()));
      return listOfUsers;
    } catch (Exception) {
      dbHelper.showAlert(context, "Error", "Try Again");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: getAllUsers(),
        builder: (BuildContext context, AsyncSnapshot usersData) {
          return usersData.hasData
              ? new Scaffold(
                  body: ListView.builder(
                      itemCount: usersData.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return new ListTile(
                          leading: Image.asset(
                            'assets/user.png',
                            width: 70.0,
                            height: 70.0,
                          ),
                          title: Text(
                            usersData.data[index].name,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 20.0),
                          ),
                          subtitle: Text(
                            "Age :" + usersData.data[index].age.toString(),
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                            //Redirecting to UserDetails page with user's id
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new UserDetailsPage(
                                      userId: usersData.data[index].id)),
                            );
                          },
                        );
                      }))
              : new Center(
                child:new SizedBox( 
                  child:new CircularProgressIndicator(),
                  width: 100.0,
                  height: 100.0,
                  )
                  );
          ///load until snapshot.hasData resolves to true
        });
  }
}
