import 'package:flutter/material.dart';
import './dbhelper.dart';
import './dashboard_page.dart';
import './registration_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'Login';
  static String routeName = '/loginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final dbHelper = DBHelper.dbhelper;
  var _emailTxt = new TextEditingController();
  var _passwordTxt = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
        tag: 'hero',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: new Image.asset(
            'assets/user.png',
          ),
        ));

    final email = TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: _emailTxt,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Enter Email',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final password = TextFormField(
        autofocus: false,
        controller: _passwordTxt,
        decoration: InputDecoration(
            hintText: 'Enter Password',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            verifyUserByCredentials();
          },
          color: Colors.lightBlueAccent,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final forgotLabel = FlatButton(
        child: Text('Forgot Password', style: TextStyle(color: Colors.black54)),
        onPressed: () {});

    final registerLabel = FlatButton(
        child: Text("Haven't registered?Sign Up here",
            style: TextStyle(color: Colors.black54)),
        onPressed: () {
          Navigator.of(context).pushNamed(RegistrationPage.routeName);
        });

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 20.0),
            email,
            SizedBox(height: 20.0),
            password,
            SizedBox(height: 20.0),
            loginButton,
            SizedBox(height: 5.0),
            registerLabel,
            SizedBox(height: 5.0),
            forgotLabel
          ],
        )));
  }

  void verifyUserByCredentials() async {
    // dbHelper.resetDatabase();
    //dbHelper.seedDataToDatabase();
    if (_emailTxt.text.trim() != "" && _passwordTxt.text.trim() != "") {
      final user = await dbHelper.verifyUserByCredentials(
          _emailTxt.text, _passwordTxt.text);
      if (user != null) {
        print(user.name);
        if (await dbHelper.saveSharedPreferences("userId", user.id)) {
          Navigator.of(context).pushNamed(DashboardPage.routeName);
        }
        ;
      } else {
        dbHelper.showAlert(context, "Validation Error",
            "Please enter valid username and password");
        // Fluttertoast.showToast(msg:"Please enter valid username and password",toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.BOTTOM,backgroundColor: Color.fromRGBO(255, 0, 0, 0.3),textColor: Color.fromRGBO(255, 255,255, 1) );
      }
    } else {
      dbHelper.showAlert(
          context, "Error", "Please enter Username and Password");
      // Fluttertoast.showToast(msg:"Please enter Username and Password",toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.BOTTOM,backgroundColor: Color.fromRGBO(255, 0, 0, 0.3),textColor: Color.fromRGBO(255, 255,255, 1) );
    }
  }
}
