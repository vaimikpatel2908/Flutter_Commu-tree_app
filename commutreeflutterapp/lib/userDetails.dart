import 'package:flutter/material.dart';


class UserDetailsPage extends StatefulWidget {
  int userId=0;

  UserDetailsPage({Key key,this.userId}):super(key:key);

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("UserDetails page ${widget.userId}"),
    );
  }
}