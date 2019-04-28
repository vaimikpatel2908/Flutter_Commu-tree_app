import 'package:flutter/material.dart';

class PopupMenu {
  PopupMenu({this.title, this.icon});
 
  String title;
  IconData icon;

  static List<PopupMenu> menus = <PopupMenu>[
  PopupMenu(title: 'Home', icon: Icons.home),
  PopupMenu(title: 'Bookmarks', icon: Icons.bookmark),
  PopupMenu(title: 'Settings', icon: Icons.settings),
];
}