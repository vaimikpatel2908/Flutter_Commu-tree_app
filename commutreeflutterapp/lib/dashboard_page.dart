import 'package:flutter/material.dart';
import 'dbhelper.dart';

class DashboardPage extends StatefulWidget {
  static String tag='Dashboard';
  static String routeName="/dashboardPage";

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
tag:'hero',
child: CircleAvatar(
  backgroundColor:Colors.transparent,
  radius:48.0,
  child: new Image.asset('assets/user.png',),
)
    );

    final email=TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Enter Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        )
      )
    );


    
    final password=TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Enter Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        )
      )
    );


    
    
    final loginButton=Padding(
      padding: EdgeInsets.symmetric(
        vertical:16.0 
        ),
        child: Material(
          borderRadius: BorderRadius.circular(30.0),
          shadowColor: Colors.lightBlueAccent.shade100,
          elevation: 5.0,
          child: MaterialButton(
            minWidth: 200.0,
            height: 42.0,
            onPressed: (){

            },
            color: Colors.lightBlueAccent,
            child: Text('Log In',
            style:TextStyle(color:Colors.white)),
          ),
        ),
    );

    final forgotLabel=FlatButton(child: Text('Forgot Password',style: TextStyle(color: Colors.black54)
    ),
    onPressed:(){

    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left:24.0,right: 24.0),
          children: <Widget>[
            email,
            SizedBox(height:20.0),
            password,
            SizedBox(height:20.0),            
            loginButton,
            SizedBox(height:20.0),
            forgotLabel
          ],
          )
      )
    );
  
  }
}