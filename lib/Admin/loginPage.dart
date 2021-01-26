import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:stock_management/Admin/dashboardPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginPage extends StatefulWidget {
  static String id = 'loginPage';

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final emailfield = TextEditingController();
  final passwordfield = TextEditingController();
  bool pass = true;
  bool spinnercircle = false;
  var icon = Icon(Icons.visibility_off);

  final auth = FirebaseAuth.instance;
  String Email;
  String Password;

  void getclear() {
    emailfield.clear();
    passwordfield.clear();
  }

  @override
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
        body: ModalProgressHUD(
          inAsyncCall: spinnercircle,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
              Color(0xFF922D4B),
            ),
          ),
          child: Container(
            color: Color(0xFF922D4B),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 6 + 80,
                        height: MediaQuery.of(context).size.height / 6 + 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    Colors.grey, BlendMode.exclusion),
                                fit: BoxFit.cover,
                                image: AssetImage('images/conf.png'))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Confectionary Food's",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 100 / 3,
                          fontWeight: FontWeight.w600),
                    ),
                    Divider(
                      height: 100 / 1.5,
                      color: Colors.grey,
                      endIndent: 200 / 4.5,
                      indent: 200 / 4.5,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: TextField(
                          controller: emailfield,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (String value) {
                            Email = value;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                              size: 25,
                            ),
                            hintText: 'Email',
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 50,
                        child: TextField(
                          controller: passwordfield,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (String value) {
                            Password = value;
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (pass == true) {
                                      icon = Icon(Icons.visibility);
                                      pass = false;
                                    } else {
                                      icon = Icon(Icons.visibility_off);
                                      pass = true;
                                    }
                                  });
                                },
                                icon: icon,
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(
                                Icons.security_outlined,
                                color: Colors.grey,
                                size: 25,
                              ),
                              hintText: 'Password',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.green))),
                          obscureText: pass,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8 - 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4 + 50,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30)),
                        child: MaterialButton(
                          height: MediaQuery.of(context).size.height / 13,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () async {
                            setState(() {
                              spinnercircle = true;
                            });
                            try {
                              print('sdfsdfsdfsd');
                              final user =
                                  await auth.signInWithEmailAndPassword(
                                      email: Email, password: Password);
                              final Currentuser = user.user.email;
                              print(Currentuser);
                              if (Currentuser == "manager@yahoo.com") {
                                Navigator.pushNamed(context, dashboardPage.id);
                              }
                              setState(() {
                                spinnercircle = false;
                              });
                            } catch (e) {
                              print(e);
                              Timer timer =
                                  Timer(Duration(milliseconds: 3000), () {
                                Navigator.pop(context);
                              });
                              showCupertinoDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        elevation: 50,
                                        title: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          child: Center(
                                            child: Text(
                                              "Wrong Info !",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 27),
                                            ),
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      )).then((value) {
                                timer?.cancel();
                                timer = null;
                              });
                              setState(() {
                                spinnercircle = false;
                              });
                            }
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    ));
  }
}
