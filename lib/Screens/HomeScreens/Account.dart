import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Screens/Auth/signIn.dart';
import 'package:udemy_clone/Screens/LandingPage/landingPage.dart';
import 'package:udemy_clone/Screens/coursesListView.dart';
import 'package:udemy_clone/globals.dart' as globals;

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: globals.isLoggedIn
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                            onPressed: () {
                              const name = '{"name": "My List"}';
                              Get.to(CourseFullListView(),
                                  arguments: json.decode(name));
                            },
                            icon: Icon(FontAwesomeIcons.shoppingCart)),
                      )
                    : Container())
          ],
          backgroundColor: Colors.black,
          title: Text('Account',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: !globals.isLoggedIn
              ? [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 20),
                    child: Text(
                      'Help and Support',
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ),
                  ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 18, color: Colors.white),
                      title: Text('About Udemy',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 18, color: Colors.white),
                      title: Text('About Udemy for Business',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 18, color: Colors.white),
                      title: Text('Frequently asked questions',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 18, color: Colors.white),
                      title: Text('Share the Udemy app',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Diagnostics',
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ),
                  ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 18, color: Colors.white),
                      title: Text('Status',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  Center(
                    child: MaterialButton(
                      onPressed: () {
                        globals.isLoggedIn = true;
                        Get.to(SignIn());
                      },
                      child: Text('Sign in',
                          style: TextStyle(color: Colors.lightBlue)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
                    child: Center(
                      child: Text(
                        'Udemy Clone v1.00',
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ),
                  )
                ]
              : [
                  SizedBox(
                      height: 300,
                      width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Jasitharan Pakeerathan',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 24.0)),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(FontAwesomeIcons.google,
                                      color: Colors.white),
                                  Text('pakeejasi@gmail.com',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 20.0))
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: MaterialButton(
                                onPressed: () {},
                                child: Text('Become an instructor',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold))),
                          )
                        ],
                      )),
                  Text(
                    'Video preferences',
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                  ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 18, color: Colors.white),
                      title: Text('Download Options',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 18, color: Colors.white),
                      title: Text('Video Playback Options',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  Text(
                    'Account settings',
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                  ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 18, color: Colors.white),
                      title: Text('Account security',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 18, color: Colors.white),
                      title: Text('Email notification preferences',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 18, color: Colors.white),
                      title: Text('Learning reminders',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  Text(
                    'Help and Support',
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                  ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 18, color: Colors.white),
                      title: Text('About Udemy',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 18, color: Colors.white),
                      title: Text('About Udemy for Business',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 18, color: Colors.white),
                      title: Text('Frequently asked questions',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 18, color: Colors.white),
                      title: Text('Share the Udemy app',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  Text(
                    'Diagnostics',
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                  ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: 18, color: Colors.white),
                      title: Text('Status',
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.0))),
                  Center(
                    child: MaterialButton(
                      onPressed: () {
                        globals.isLoggedIn = false;
                        Get.to(LandingPage());
                      },
                      child: Text('Sign out',
                          style: TextStyle(color: Colors.lightBlue)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 10.0),
                    child: Center(
                      child: Text(
                        'Udemy Clone v1.00',
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ),
                  )
                ],
        ),
      )),
    );
  }
}
