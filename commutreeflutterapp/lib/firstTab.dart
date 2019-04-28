import 'package:flutter/material.dart';
import './dbhelper.dart';
import './models/Person.dart';
import './userDetails.dart';

class FirstTab extends StatefulWidget {
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  final DBHelper dbHelper=DBHelper.dbhelper;
  Person person=new Person();
  List<Person> usersList=new List<Person>();

  @override
  void initState(){
    super.initState();
    setState(() async {
          usersList= await getAllUsers();
    });
  }

  Future<List<Person>> getAllUsers() async {
    try{
    int userId= await dbHelper.getSharedPreferences("userId");
    List<Person> listOfUsers= await dbHelper.selectAllUsers(int.tryParse(userId.toString()));
    return listOfUsers;
    }
    catch(Exception){
      dbHelper.showAlert(context, "Error", "Try Again");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount:usersList.length,
        itemBuilder: (BuildContext context,int index){
          return new ListTile(
            leading: Image.asset('assets/user.png',width: 70.0,height: 70.0,),
            title: Text(usersList[index].name,textAlign: TextAlign.left,style: TextStyle(fontSize: 20.0),),
            subtitle: Text("Age :"+usersList[index].age.toString(),textAlign: TextAlign.left,),
            onTap: () async {
              MaterialPageRoute route= await new MaterialPageRoute(
                builder: (BuildContext context) {
                  new UserDetailsPage(userId:usersList[index].id);
              });

              //Redirecting to UserDetails page with user's id
              Navigator.of(context).push(route);
            },
          );
        },
      ),
    );


  }
}