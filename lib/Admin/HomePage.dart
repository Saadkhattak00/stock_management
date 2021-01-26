import 'package:flutter/material.dart';
import 'package:stock_management/Admin/recordPage.dart';
import 'package:stock_management/Admin/stockPage.dart';
import 'BuyersPage.dart';
import 'SellersPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF922D4B),
        centerTitle: true,
        title: Text(
          "Confectionary Food's",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2 - 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, stockPage.id);
                    },
                    child: dash(
                      text: 'STOCK',
                      icon: Icons.shopping_cart_outlined,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, recordPage.id);
                    },
                    child: dash(
                      text: "RECORD",
                      icon: Icons.receipt_outlined,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2 - 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, BuyersPage.id);
                    },
                    child: dash(
                      text: "BUYER'S",
                      icon: Icons.archive_outlined,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SellersPage.id);
                    },
                    child: dash(
                      text: "SELLER'S",
                      icon: Icons.unarchive_outlined,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class dash extends StatelessWidget {
  String text;
  var icon;
  @override
  dash({this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 40,
        height: MediaQuery.of(context).size.height / 2.5 - 30,
        child: Card(
          elevation: 30,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Icon(
                icon,
                size: 50,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
