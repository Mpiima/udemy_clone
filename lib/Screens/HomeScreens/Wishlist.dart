import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:udemy_clone/Screens/HomeScreens/sectionCategories.dart';
import 'package:udemy_clone/Screens/coursesListView.dart';
import 'package:udemy_clone/globals.dart' as globals;

import '../courseView.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  Future<List> getData() async {
    final String response = await rootBundle.loadString('assets/courses.json');
    final data = await json.decode(response);
    final rest = data['courses'] as List;
    return rest;
  }

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
          title: Text('Wishlist',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      body: globals.isLoggedIn
          ? FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ));
                } else if (snapshot.data == null) {
                  return Container();
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, i) {
                            Map data = Map.from(snapshot.data[i]);
                            return CourseView(50, data['bestseller'], data);
                          },
                          separatorBuilder: (ctx, i) => Divider(
                              color: Colors.grey.shade800,
                              thickness: 0.25,
                              endIndent: 8.0,
                              indent: 8.0,
                              height: 3),
                        ),
                        Divider(
                            color: Colors.grey.shade800,
                            thickness: 0.25,
                            endIndent: 8.0,
                            indent: 8.0,
                            height: 3),
                      ],
                    ),
                  );
                }
              },
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                child: Icon(FontAwesomeIcons.heart,
                                    color: Colors.white),
                                radius: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text('Want to save something for later',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Text('Your wishlist will go here.',
                                    style: TextStyle(
                                        color: Colors.grey.shade800,
                                        fontSize: 20)),
                              )
                            ])),
                    CategoriesList()
                  ],
                ),
              ),
            ),
    );
  }
}
