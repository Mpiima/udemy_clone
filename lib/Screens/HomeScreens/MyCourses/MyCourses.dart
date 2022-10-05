import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Screens/HomeScreens/MyCourses/myCoursePage.dart';

import 'package:udemy_clone/Screens/HomeScreens/sectionCategories.dart';
import 'package:udemy_clone/globals.dart' as globals;

import '../../coursesListView.dart';

class MyCourses extends StatefulWidget {
  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
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
          title: Text('All courses',
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
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (ctx, i) {
                            return InkWell(
                              radius: 1,
                              onTap: () {
                                Get.to(MyCoursePage());
                              },
                              child: ListTile(
                                leading: Container(
                                  width: 50,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            snapshot.data[i]['image']),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(snapshot.data[i]['name'],
                                      overflow: TextOverflow.visible,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 18.0)),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(
                                          snapshot.data[i]['createdBy']
                                              .join(', '),
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 12.0)),
                                    ),
                                    Text('START COURSE',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 14.0)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
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
                                child: Text('What will you learn first?',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Text('Your courses will go here.',
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
