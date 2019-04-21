//help us to bulid flutter component 
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'First Flutter App',
      debugShowCheckedModeBanner: false,
      theme : ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Numito'
      ),
      home:LoginPage(),
    );
  }
}