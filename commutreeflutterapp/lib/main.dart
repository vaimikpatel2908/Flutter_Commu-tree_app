//help us to bulid flutter component 
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'dashboard_page.dart';
import 'registration_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Commu-tree',
      debugShowCheckedModeBanner: false,
      theme : ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Numito'
      ),
      home:LoginPage(),
      routes: <String,WidgetBuilder>{
        DashboardPage.routeName:(context) => new DashboardPage(),
        LoginPage.routeName:(context) => new LoginPage(),
        RegistrationPage.routeName:(context) => new RegistrationPage(),
      },
    );
  }
}