import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Model/categoryModel.dart';
import 'package:udemy_clone/Screens/Auth/signIn.dart';

import 'package:udemy_clone/Screens/Categories.dart';
import 'package:udemy_clone/Screens/DetailSection/categoryDetail.dart';

import 'package:udemy_clone/Screens/HomeScreens/Featured/Sections/sectionMain.dart';
import 'package:udemy_clone/Screens/coursesListView.dart';

import 'package:udemy_clone/globals.dart' as globals;

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  Future<Map> getData() async {
    final String response = await rootBundle.loadString('assets/courses.json');
    final data = await json.decode(response);
    return data as Map;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: InkWell(
                        onTap: () {
                          const name = '{"name": "Aspire More"}';
                          Get.to(CourseFullListView(),
                              arguments: json.decode(name));
                        },
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        bottom:
                                            4.0), //some spacing to the child from bottom
                                    child: Container(
                                      width: double.infinity,
                                      child: Text('Learn for your future',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        bottom:
                                            16.0), //some spacing to the child from bottom
                                    child: Container(
                                      width: double.infinity,
                                      child: Text(
                                          'Get the courses you need from \$12.99',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 0.8),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                    )),
                              ],
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('images/featured_cover.jpg'))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 12),
                      child: Container(
                          width: double.infinity,
                          height:
                              MediaQuery.of(context).size.height * 0.25 * 0.16,
                          child: MaterialButton(
                            onPressed: () {
                              const name = '{"name": "Aspire More"}';
                              Get.to(CourseFullListView(),
                                  arguments: json.decode(name));
                            },
                            child: Text(
                              'Thousands of courses from just \$12.99',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.teal.shade500,
                                  Colors.teal.shade900,
                                ],
                              ),
                              color: Colors.blueAccent)),
                    ),
                    SectionMain(
                        sectionName: 'Featured',
                        sectionButtonName: '',
                        viewHeight: 320,
                        viewWidth: MediaQuery.of(context).size.width * 0.63,
                        imageSize: 0.47,
                        courseData: snapshot.data['courses']),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text('Categories',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: TextButton(
                                child: Text('SEE ALL',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14)),
                                onPressed: () {
                                  Get.to(Categories(Container()));
                                },
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      categoriesList.sublist(0, 6).map((e) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 4),
                                      child: TextButton.icon(
                                        icon: e.iconName,
                                        label: Text(e.name),
                                        onPressed: () {
                                          Get.to(CategoryDetail(),
                                              arguments: categoriesList[
                                                      categoriesList.indexOf(e)]
                                                  .name);
                                        },
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(12.0)),
                                            overlayColor:
                                                MaterialStateProperty.all(
                                                    Colors.grey.shade800),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromRGBO(
                                                        52, 63, 86, 0.5)),
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ))),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: categoriesList.sublist(6).map((e) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.0, horizontal: 4.0),
                                      child: TextButton.icon(
                                        icon: e.iconName,
                                        label: Text(e.name),
                                        onPressed: () {
                                          Get.to(CategoryDetail(),
                                              arguments: categoriesList[
                                                  categoriesList.indexOf(e)]);
                                        },
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(12.0)),
                                            overlayColor:
                                                MaterialStateProperty.all(
                                                    Colors.grey.shade800),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color.fromRGBO(
                                                        52, 63, 86, 0.5)),
                                            foregroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ))),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SectionMain(
                      sectionName: 'Top courses in',
                      sectionButtonName: 'Design',
                      viewHeight: 280,
                      viewWidth: MediaQuery.of(context).size.width * 0.45,
                      imageSize: 0.4,
                      courseData: snapshot.data['courses'],
                    ),
                    SectionMain(
                      sectionName: 'Top courses in',
                      sectionButtonName: 'Business',
                      viewHeight: 280,
                      viewWidth: MediaQuery.of(context).size.width * 0.45,
                      imageSize: 0.4,
                      courseData: snapshot.data['courses'],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 150,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 8.0, top: 16),
                                child: Text('Top companies trust Udemy',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(FontAwesomeIcons.ship,
                                        color: Colors.white),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(FontAwesomeIcons.ship,
                                        color: Colors.white),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(FontAwesomeIcons.ship,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              TextButton(
                                child: Text('Try Udemy for Business',
                                    style: TextStyle(color: Colors.blue)),
                                onPressed: () {},
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.shade700,
                              width: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SectionMain(
                      sectionName: 'Top courses in',
                      sectionButtonName: 'Development',
                      viewHeight: 320,
                      viewWidth: MediaQuery.of(context).size.width * 0.63,
                      imageSize: 0.47,
                      courseData: snapshot.data['courses'],
                    ),
                    SectionMain(
                      sectionName: 'Top courses in',
                      sectionButtonName: 'IT & Software',
                      viewHeight: 280,
                      viewWidth: MediaQuery.of(context).size.width * 0.45,
                      imageSize: 0.4,
                      courseData: snapshot.data['courses'],
                    ),
                    SectionMain(
                      sectionName: 'Top courses in',
                      sectionButtonName: 'Personal Development',
                      viewHeight: 280,
                      viewWidth: MediaQuery.of(context).size.width * 0.45,
                      imageSize: 0.4,
                      courseData: snapshot.data['courses'],
                    ),
                    SectionMain(
                      sectionName: 'Because you searched for ',
                      sectionButtonName: '"java"',
                      viewHeight: 320,
                      viewWidth: MediaQuery.of(context).size.width * 0.63,
                      imageSize: 0.47,
                      courseData: snapshot.data['courses'],
                    ),
                    SectionMain(
                      sectionName: 'Students are viewing',
                      sectionButtonName: '',
                      viewHeight: 280,
                      viewWidth: MediaQuery.of(context).size.width * 0.45,
                      imageSize: 0.4,
                      courseData: snapshot.data['courses'],
                    ),
                    SectionMain(
                      sectionName: 'Short and sweet courses for you',
                      sectionButtonName: '',
                      viewHeight: 280,
                      viewWidth: MediaQuery.of(context).size.width * 0.45,
                      imageSize: 0.4,
                      courseData: snapshot.data['courses'],
                    ),
                  ],
                ),
              );
            }
          },
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            globals.isLoggedIn
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
                : TextButton(
                    onPressed: () {
                      globals.isLoggedIn = true;
                      Get.to(SignIn());
                    },
                    child:
                        Text('SIGN IN', style: TextStyle(color: Colors.white)),
                  )
          ],
          //    title: Text('Featured', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
        ));
  }
}
