import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Screens/HomeScreens/Featured/Sections/sectionMain.dart';

import '../courseView.dart';

class CategoryDetail extends StatelessWidget {
  const CategoryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var line1 = [
      'Blender',
      'Photoshop',
      'User Experience Design',
      'Drawing',
      'After Effects',
      'Adobe XD',
      'AutoCAD',
    ];

    var line2 = [
      'Development',
      'Business',
      'Office Productivity',
      'Design',
      'Marketing',
      'Health & Fitness',
      'Music'
    ];

    Future<Map> getData() async {
      final String response =
          await rootBundle.loadString('assets/courses.json');
      final data = await json.decode(response);
      return data as Map;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: FutureBuilder(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 16.0, bottom: 8.0),
                      child: FittedBox(
                        child: Text(Get.arguments,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SectionMain(
                      sectionName: 'Courses you get started',
                      sectionButtonName: '',
                      viewHeight: 340,
                      viewWidth: MediaQuery.of(context).size.width * 0.75,
                      imageSize: 0.5,
                      courseData: snapshot.data['courses'],
                    ),
                    SectionMain(
                      sectionName: 'Featured courses',
                      sectionButtonName: '',
                      viewHeight: 320,
                      viewWidth: MediaQuery.of(context).size.width * 0.63,
                      imageSize: 0.47,
                      courseData: snapshot.data['courses'],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 8.0, bottom: 8.0),
                      child: Text('Popular topics',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: line1.map((e) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 4),
                                child: TextButton(
                                  child: Text(e),
                                  onPressed: () {
                                    print('button pressed');
                                  },
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.all(12.0)),
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.grey.shade800),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromRGBO(52, 63, 86, 0.5)),
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
                            children: line2.map((e) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 4.0),
                                child: TextButton(
                                  child: Text(e),
                                  onPressed: () {
                                    print('button pressed');
                                  },
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.all(12.0)),
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.grey.shade800),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromRGBO(52, 63, 86, 0.5)),
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
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 24.0, bottom: 8),
                      child: Text('Subcategories',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: line1.map((e) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 4),
                                child: TextButton.icon(
                                  icon: Icon(Icons.remove_red_eye_outlined),
                                  label: Text(e),
                                  onPressed: () {
                                    print('button pressed');
                                  },
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.all(12.0)),
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.grey.shade800),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromRGBO(52, 63, 86, 0.5)),
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
                            children: line2.map((e) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 4.0),
                                child: TextButton.icon(
                                  icon: Icon(Icons.remove_red_eye_outlined),
                                  label: Text(e),
                                  onPressed: () {
                                    print('button pressed');
                                  },
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.all(12.0)),
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.grey.shade800),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromRGBO(52, 63, 86, 0.5)),
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
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, bottom: 8.0, top: 24.0),
                      child: Text('Top instructors',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: line1.map((e) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  height: 100,
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  child: ListTile(
                                      leading: Container(
                                          width: 70.0,
                                          height: 70.0,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      'images/instructor_1.jpg')))),
                                      title: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 4.0, top: 8.0),
                                        child: Text('Daniel Walter Scott',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 1),
                                            child: Text(
                                                'Adobe Certified Instructor & Adobe Certified Expert',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 1),
                                            child: Text('402,922 students',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 1),
                                            child: Text('27 courses',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        ],
                                      )),
                                ),
                              );
                            }).toList(),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: line1.map((e) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: EdgeInsets.only(left: 8.0),
                                  height: 100,
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  child: ListTile(
                                      leading: Container(
                                          width: 70.0,
                                          height: 70.0,
                                          decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      'images/instructor_1.jpg')))),
                                      title: Text('Daniel Walter Scott',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 1),
                                            child: Text(
                                                'Adobe Certified Instructor & Adobe Certified Expert',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 1),
                                            child: Text('402,922 students',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 1),
                                            child: Text('27 courses',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        ],
                                      )),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: Text('All courses',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data['courses'].length,
                            itemBuilder: (ctx, i) {
                              return CourseView(
                                  50, true, snapshot.data['courses'][i]);
                            }),
                      ],
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(FontAwesomeIcons.shoppingCart))
          ],
          backgroundColor: Colors.black,
          title: Text('Featured', style: TextStyle(color: Colors.white))),
    );
  }
}
