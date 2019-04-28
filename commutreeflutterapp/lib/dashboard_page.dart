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
        leading: Icon(Icons.dashboard,color: Colors.white,size: 40.0,),
        title: new Text("Dashboard",style: TextStyle(color: Colors.white70,fontSize: 25.0),),
        backgroundColor: Colors.blue.shade900,
        bottom: new TabBar(
          controller: _tabController,
          labelColor: Colors.white70,
          labelStyle: TextStyle(color: Colors.white70,fontSize: 20.0),
          unselectedLabelColor: Colors.white30,
          unselectedLabelStyle: TextStyle(color: Colors.white30),
          tabs: <Tab>[
              new Tab(icon: new Icon(Icons.person),text: "Users",),
              new Tab(icon: new Icon(Icons.person_add),text: "Requests"),
              new Tab(icon: new Icon(Icons.group),text: "Friends")
          ],
          ),
          actions: <Widget>[
            new PopupMenuButton(icon: new Icon(Icons.menu),itemBuilder: (context){}),
          ],
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new first.FirstTab(),
            new second.SecondTab(),
            new third.Thirdpage(),
          ],
        ),
        backgroundColor: Colors.grey.shade100,
        
        );

  }
}