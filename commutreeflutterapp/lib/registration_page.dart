import 'package:flutter/material.dart';
import 'dbhelper.dart';
import 'login_page.dart';

class RegistrationPage extends StatefulWidget {

  static String tag='Registration';
  static String routeName='/registrationPage';

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final dbHelper=DBHelper.dbhelper;
  var _emailTxt=new TextEditingController();
  var _passwordTxt=new TextEditingController();
  var _nameTxt=new TextEditingController();
  var _ageTxt=new TextEditingController();

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

    final name=TextFormField(
        controller: _nameTxt,
        autofocus: false,
        decoration: InputDecoration(
        hintText: 'Enter Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        )
      )
    );


    final age=TextFormField(
      controller: _ageTxt,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Enter Age',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        )
      )
    );


    final email=TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _emailTxt,
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
      controller: _passwordTxt,
      decoration: InputDecoration(
        hintText: 'Enter Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        )
      )
    );


    
    
    final registerButton=Padding(
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
              registerUser();
            },
            color: Colors.lightBlueAccent,
            child: Text('Register',
            style:TextStyle(color:Colors.white)),
          ),
        ),
    );

    final loginLabel=FlatButton(child: Text('Already have an Acount? Log In Here',style: TextStyle(color: Colors.black54)
    ),
    onPressed:(){
      Navigator.of(context).pushNamed(LoginPage.routeName);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left:24.0,right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height:20.0),
            name,
            SizedBox(height:20.0),
            age,
            SizedBox(height:20.0),
            email,
            SizedBox(height:20.0),
            password,
            SizedBox(height:5.0),            
            registerButton,
            SizedBox(height:5.0),
            loginLabel
          ],
          )
      )
    );
  }

  void registerUser(){ 
      
    try{
      if(_nameTxt.text.trim() != "" && _ageTxt.text.trim() != "" && _emailTxt.text != "" && _passwordTxt.text != "" )
      {
        int age=int.tryParse(_ageTxt.text);
            
        Map<String,dynamic> newUser= {
          DBHelper.ColumnName:_nameTxt.text,
          DBHelper.ColumnAge:age,
          DBHelper.ColumnEmail:_emailTxt.text,
          DBHelper.ColumnPassword:_passwordTxt.text,
        };

        //inserting user data into registration table
        dbHelper.insert(newUser, DBHelper.RegistrationTable);

        //Redirecting to login Page
        Navigator.of(context).pushNamed(LoginPage.routeName);
      }
      else
      {
        dbHelper.showAlert(context, "Data validation error", "Please enter valid data");
      }
    }
    catch(FormatException){
      dbHelper.showAlert(context, "Data validation error", "Please enter valid age");
    }
  }
}