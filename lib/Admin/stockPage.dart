import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class stockPage extends StatefulWidget {
  static String id = 'stockPage';
  @override
  _stockPageState createState() => _stockPageState();
}

class _stockPageState extends State<stockPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF922D4B),
        centerTitle: true,
        title: Text(
          'Inventory',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3 + 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 1)),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5 + 10,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(18),
                        // border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        color: Colors.black45,
                        size: 100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Product Name",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, right: 8, left: 8, bottom: 8),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Company Name",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12, right: 2, left: 8, bottom: 12),
                          child: Container(
                            child: Text(
                              "Purchase Price:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12, right: 12, left: 0, bottom: 12),
                          child: Container(
                            color: Colors.red,
                            child: Text(
                              "100,000",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12, right: 2, left: 12, bottom: 12),
                          child: Container(
                            child: Text(
                              "Sell Price:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12, right: 12, left: 0, bottom: 12),
                          child: Container(
                            color: Colors.green,
                            child: Text(
                              "550000",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        child: Text(
                          "Quantity",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0, right: 12, left: 12, bottom: 8),
                      child: Container(
                        color: Colors.green,
                        child: Text(
                          "50",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
