import 'package:flutter/material.dart';
import './firstTab.dart' as first;
import './secondTab.dart' as second;
import './thirdTab.dart' as third; 

class DashboardPage extends StatefulWidget {
  static String tag='Dashboard';
  static String routeName="/dashboardPage";

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin {
  
    TabController _tabController;
    

    @override
    void initState(){
      super.initState();
      _tabController=new TabController(vsync: this,length: 4);
    }

    @override
    void dispose(){
      _tabController.dispose();
      super.dispose();
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Dashboard",style: TextStyle(color: Colors.white70),),
        backgroundColor: Colors.blue.shade900,
        bottom: new TabBar(
          controller: _tabController,
          labelColor: Colors.white30,
          labelStyle: TextStyle(color: Colors.white30),
          unselectedLabelColor: Colors.white54,
          unselectedLabelStyle: TextStyle(color: Colors.white54),
          tabs: <Tab>[
              new Tab(icon: new Icon(Icons.person),text: "Users",),
              new Tab(icon: new Icon(Icons.person_add),text: "Requests"),
              new Tab(icon: new Icon(Icons.group),text: "Friends")
          ],
          ),
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new first.FirstTab(),
            new second.SecondTab(),
            new third.Thirdpage(),
          ],
        ),
        
        );

    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   body: Center(
    //     child:ListView(
    //       shrinkWrap: true,
    //       padding: EdgeInsets.only(left:24.0,right: 24.0),
    //       children: <Widget>[
    //         SizedBox(height:20.0),
    //         dashboardTxt
    //       ],
    //       )
    //   )
    // );
  }
}