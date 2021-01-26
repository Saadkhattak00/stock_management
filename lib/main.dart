import 'package:flutter/material.dart';
import 'package:stock_management/Admin/AddRecord.dart';
import 'package:stock_management/Admin/recordPage.dart';
import 'package:stock_management/Admin/stockPage.dart';
import 'Admin/loginPage.dart';
import 'Admin/dashboardPage.dart';
import 'package:stock_management/Admin/BuyersPage.dart';
import 'package:stock_management/Admin/SellersPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: loginPage.id,
      routes: {
        loginPage.id: (context) => loginPage(),
        dashboardPage.id: (context) => dashboardPage(),
        stockPage.id: (context) => stockPage(),
        recordPage.id: (context) => recordPage(),
        BuyersPage.id: (context) => BuyersPage(),
        SellersPage.id: (context) => SellersPage(),
        AddRecord.id: (context) => AddRecord(),
      },
    );
  }
}
