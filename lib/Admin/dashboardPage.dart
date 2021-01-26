import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_management/Admin/AddRecord.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:stock_management/Admin/HomePage.dart';

class dashboardPage extends StatefulWidget {
  static String id = 'dashboardPage';
  @override
  _dashboardPageState createState() => _dashboardPageState();
}

class _dashboardPageState extends State<dashboardPage> {
  int _page = 0;
  final _pageOption = [
    HomePage(),
    AddRecord(),
  ];
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.home_outlined, size: 30),
          Icon(
            Icons.add,
            size: 30,
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color(0xFF922D4B),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 1000),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _pageOption[_page],
    ));
  }
}
