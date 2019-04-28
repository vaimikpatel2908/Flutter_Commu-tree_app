import 'package:commutreeflutterapp/models/Person.dart';
import 'package:flutter/material.dart';
import 'dbhelper.dart';

class SecondTab extends StatefulWidget {
  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  final DBHelper dbHelper=DBHelper.dbhelper;
  Person person=new Person();
  List<Person> usersList=new List<Person>();

  @override
  void initState(){
    super.initState();
    setState(() {
          usersList= person.seedData();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount:usersList.length,
        itemBuilder: (BuildContext context,int index){
          return new Card(
            child:new Container(
              padding: EdgeInsets.all(5.0),
              child: new Row(
                children: <Widget>[
                  Image.asset('assets/user.png',width: 70.0,height: 70.0,),
                  new Column(
                    children: <Widget>[
                      Text(usersList[index].name,textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0),),
                      Text("Age :"+usersList[index].age.toString(),textAlign: TextAlign.left,),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ],
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            )
          );

        },
      ),
    );
  }
}
