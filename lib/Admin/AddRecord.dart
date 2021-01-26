import 'dart:io';

import 'package:flutter/material.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'HomePage.dart';

class AddRecord extends StatefulWidget {
  static String id = 'AddRecord';

  AddRecord({this.app});
  final FirebaseApp app;
  @override
  _AddRecordState createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  DatabaseReference _ref;

  String dropdownValue = 'Buyer';
  TextEditingController _customerName,
      // _phoneNo,
      _productName,
      _companyName,
      _purchasePrice,
      _sellingPrice,
      _quantity;
  @override
  void initState() {
    _customerName = TextEditingController();
    // _phoneNo = TextEditingController();
    _productName = TextEditingController();
    _companyName = TextEditingController();
    _purchasePrice = TextEditingController();
    _sellingPrice = TextEditingController();
    _quantity = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Records');
  }

  @override
  File _image;
  Future getImage() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image != null) {
      _image = File(image.path);
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF922D4B),
          centerTitle: true,
          title: Text(
            "Add Record",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10 - 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "CUSTOMER DETAIL",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10 - 40,
                ),
                //DropDown
                Container(
                  width: MediaQuery.of(context).size.width / 4 - 2.1,
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 20,
                    elevation: 16,
                    style: TextStyle(color: Colors.black, fontSize: 30),
                    underline: Container(
                      height: 2,
                      color: Color(0xFF922D4B),
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>[
                      'Buyer',
                      'Seller',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                //CUSTOMER NAME

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    child: TextField(
                      controller: _customerName,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String value) {},
                      decoration: InputDecoration(
                        hintText: 'Customer Name',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.green)),
                      ),
                    ),
                  ),
                ),
                //PHONE NO
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: InternationalPhoneInput(
                      decoration: InputDecoration(
                        hintText: 'e.g-1234567890',
                        hintStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.green)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
                      ),
                      showCountryCodes: true,
                      showCountryFlags: true,
                    ),
                  ),
                ),
                Divider(
                  height: MediaQuery.of(context).size.height / 12,
                  color: Colors.grey,
                  indent: 30,
                  endIndent: 30,
                  thickness: 1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "PRODUCT DETAIL",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10 - 40,
                ),
                // PRODUCT IMAGE
                ClipOval(
                  child: GestureDetector(
                    onTap: () {
                      getImage();
                    },
                    child: Container(
                        color: Colors.grey,
                        width: MediaQuery.of(context).size.width / 2.5 + 20,
                        height: MediaQuery.of(context).size.height / 5 + 20,
                        child: _image == null
                            ? Icon(
                                Icons.photo,
                                size: 110,
                              )
                            : Image.file(
                                _image,
                                fit: BoxFit.cover,
                              )),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10 - 60,
                ),
                // PRODUCT NAME
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    child: TextField(
                      controller: _productName,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String value) {},
                      decoration: InputDecoration(
                        hintText: 'Product Name',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.green)),
                      ),
                    ),
                  ),
                ),
                //FACTORY/BAKER NAME
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    child: TextField(
                      controller: _companyName,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String value) {},
                      decoration: InputDecoration(
                        hintText: "Factory/Baker Name",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.green)),
                      ),
                    ),
                  ),
                ),
                // PRICES
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // PURCHASE PRICE
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 50,
                        child: TextField(
                          controller: _purchasePrice,
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {},
                          decoration: InputDecoration(
                            hintText: 'Purchasing Price',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.green)),
                          ),
                        ),
                      ),
                    ),
                    //SELLING PRICE
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 50,
                        child: TextField(
                          controller: _sellingPrice,
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {},
                          decoration: InputDecoration(
                            hintText: 'Selling Price',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.green)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //QUANTITY
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 - 90,
                    child: TextField(
                      controller: _quantity,
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {},
                      decoration: InputDecoration(
                        hintText: 'Quantity',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.green)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //MATERIAL BUTTON
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    height: 45,
                    minWidth: 150,
                    onPressed: () {
                      saveRecord();
                    },
                    color: Color(0xFF922D4B),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10 - 40,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  void saveRecord() {
    String Customername = _customerName.text;
    String ProductName = _productName.text;
    String CompanyName = _companyName.text;
    String PruchasePrice = _purchasePrice.text;
    String SellinPrice = _sellingPrice.text;
    String Quantity = _quantity.text;
    Map<String, String> Record = {
      "CustomerNAME": Customername,
      "ProductNAME": ProductName,
      "CompanyNAME": CompanyName,
      "PurchasingPRICE": PruchasePrice,
      "SellingPRICE": SellinPrice,
      "Quantity": Quantity,
    };
    _ref.push().set(Record).then((value) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    });
  }
}
