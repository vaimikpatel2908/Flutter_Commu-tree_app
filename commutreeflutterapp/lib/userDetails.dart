import 'package:commutreeflutterapp/dbhelper.dart';
import 'package:commutreeflutterapp/models/Person.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatefulWidget {
  final int favUserId;
  UserDetailsPage({Key key, @required this.favUserId}) : super(key: key);

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final dbHelper = DBHelper.dbhelper;
  String btnText = "";
  int userId = 0;


  getUserIdFromSharedPreference() async {
    int id=await dbHelper.getSharedPreferences("userId");  
      setState(() {
        userId = id;
      });
  }

  //getting user's profile
  Future<Person> getUserData(String favUserId) async {
    Person user = await dbHelper.getDataByUserId(int.parse(favUserId));

    if (user != null) {
      getUserIdFromSharedPreference();
      getRequestButtonText(favUserId, userId);
      return user;
    } else {
      return null;
    }
  }

  //getting Button text to according to request status
  getRequestButtonText(String favUserId, int userId) async {
    if (await dbHelper.hasRequest(int.parse(favUserId), userId)) {
      
        btnText = "Accept Request";  
     
    } else {
      int requestStatus =
          await dbHelper.checkRequestStatus(userId, int.parse(favUserId));
      if (requestStatus == 0) {
          btnText = "Send Request";
      } else if (requestStatus == 1) {
          btnText = "Cancel Request";  
      } else if (requestStatus == 2) {
          btnText = "Unfriend";  
      }
    }
  }

  //btnClickevent
  void requestButtonClick() {
    if (btnText.trim().toLowerCase() == "Send Request".toLowerCase()) {
      Map<String, dynamic> favRequest = {
        DBHelper.FavColumnUserId: userId,
        DBHelper.FavColumnFavUserID: int.parse('${widget.favUserId}'),
        DBHelper.FavColumnStatus: 1,
      };

      dbHelper.insert(favRequest, DBHelper.FavTableName);
      setState(() {
        btnText = "Cancel Request";
      });
      

      // try{

      // }catch(Exception){
      //   dbHelper.showAlert(context, "Error", "Try again");
      // }
    } else if (btnText.trim().toLowerCase() == "Cancel Request".toLowerCase()) {
      dbHelper.deleteFromFavourites(userId, int.parse('${widget.favUserId}'));
      setState(() {
        btnText = "Send Request";  
      });
    } else if (btnText.trim().toLowerCase() == "Unfriend".toLowerCase()) {
      dbHelper.deleteFromFavourites(userId, int.parse('${widget.favUserId}'));
      dbHelper.deleteFromFavourites(int.parse('${widget.favUserId}'), userId);
      setState(() {
        btnText = "Send Request";  
      });
    } else if (btnText.trim().toLowerCase() == "Accept request".toLowerCase()) {
      dbHelper.acceptRequest(int.parse('${widget.favUserId}'), userId);
      setState(() {
        btnText = "Unfriend";
      });  
    }
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: getUserData('${widget.favUserId}'),
        builder: (BuildContext context, AsyncSnapshot usersData) {
          return usersData.hasData
              ? new Scaffold(
                  appBar: AppBar(
                    leading: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    title: Text("User Profile",
                        style:
                            TextStyle(color: Colors.white70, fontSize: 25.0)),
                    backgroundColor: Colors.blue.shade900,
                  ),
                  body: new Center(
                    child: new SizedBox(
                      width: 250.0,
                      height: 500.0,
                      child: new ListView(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 48.0,
                            child: new Image.asset(
                              usersData.data.image != null
                                  ? usersData.data.image
                                  : 'assets/user.png',
                            ),
                          ),
                          new Center(
                            child: new SizedBox(
                              width: 250.0,
                              height: 450.0,
                              child: new ListView(
                                children: <Widget>[
                                  new Text(""),
                                  new Text(
                                    "Name : " + usersData.data.name,
                                    style: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 17.0,
                                        letterSpacing: 1.0),
                                  ),
                                  new Divider(
                                    height: 10.0,
                                  ),
                                  new Text(
                                    "Email : " + usersData.data.email,
                                    style: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 17.0,
                                        letterSpacing: 1.0),
                                  ),
                                  new Divider(
                                    height: 10.0,
                                  ),
                                  new Text(
                                    "Dob : " + usersData.data.dob,
                                    style: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 17.0,
                                        letterSpacing: 1.0),
                                  ),
                                  new Divider(
                                    height: 10.0,
                                  ),
                                  new Text(
                                    "Phone : " + usersData.data.phone,
                                    style: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 17.0,
                                        letterSpacing: 1.0),
                                  ),
                                  new Divider(
                                    height: 10.0,
                                  ),
                                  new Text(
                                    "Address : " + usersData.data.address,
                                    style: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 17.0,
                                        letterSpacing: 1.0),
                                  ),
                                  new Divider(
                                    height: 10.0,
                                  ),
                                  new Text(
                                    "City : " + usersData.data.city,
                                    style: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 17.0,
                                        letterSpacing: 1.0),
                                  ),
                                  new Divider(
                                    height: 10.0,
                                  ),
                                  new Text(
                                    "Profession : " + usersData.data.profession,
                                    style: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 17.0,
                                        letterSpacing: 1.0),
                                  ),
                                  new Divider(
                                    height: 10.0,
                                  ),
                                  new Text(
                                    "Education : " + usersData.data.education,
                                    style: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontSize: 17.0,
                                        letterSpacing: 1.0),
                                  ),
                                  new Divider(
                                    height: 10.0,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.0),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(30.0),
                                      shadowColor:
                                          Colors.lightBlueAccent.shade100,
                                      elevation: 5.0,
                                      child: MaterialButton(
                                        minWidth: 200.0,
                                        height: 42.0,
                                        onPressed: () {
                                          requestButtonClick();
                                        },
                                        color: Colors.blue.shade900,
                                        child: Text(btnText,
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  backgroundColor: Colors.grey.shade100,
                )
              : Scaffold(
                  appBar: AppBar(
                    leading: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    title: Text("User Profile",
                        style:
                            TextStyle(color: Colors.white70, fontSize: 25.0)),
                    backgroundColor: Colors.blue.shade900,
                  ),
                  body: new Center(
                    child: new SizedBox(
                      child: new CircularProgressIndicator(),
                      width: 100.0,
                      height: 100.0,
                    ),
                  ),
                  backgroundColor: Colors.grey.shade100,
                );
        });
  }
}
