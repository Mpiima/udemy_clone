import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Screens/Utility/two_icon_button.dart';
import 'package:udemy_clone/Screens/courseView.dart';
import 'package:udemy_clone/Screens/coursesListView.dart';

class Instructor extends StatelessWidget {
  const Instructor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Instructor'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                )),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('images/instructor_1.jpg'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                            child: Text('Ben Tristem',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  backgroundColor: Colors.black,
                                )),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text('Developer and Lead instructor',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16.0)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0),
                  child: Table(
                    columnWidths: {0: FractionColumnWidth(.4)},
                    children: [
                      TableRow(
                        children: [
                          Text('Total students',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16)),
                          Text('Reviews',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16))
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text('855,602',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text('296,033',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                  child: Text('About me',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                  child: ExpandableText(
                    'Jose Marcial Portilla has a BS and MS in Mechanical Engineering from Santa Clara University and years of experience as a professional instructor and trainer for Data Science and programming. He has publications and patents in various fields such as microfluidics, materials science, and data science technologies. Over the course of his career he has developed a skill set in analyzing data and he hopes to use his experience in teaching and data science to help other people learn the power of programming the ability to analyze data, as well as present the data in clear and beautiful visualizations. Currently he works as the Head of Data Science for Pierian Data Inc. and provides in-person data science and python programming training courses to employees working at top companies, including General Electric, Cigna, The New York Times, Credit Suisse, McKinsey and many more. Feel free to contact him on LinkedIn for more information on in-person training sessions or group training sessions in Las Vegas, NV.',
                    expandText: '\n\nSHOW MORE',
                    collapseText: '\n\nSHOW LESS',
                    maxLines: 6,
                    linkColor: Colors.blue,
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 26.0, left: 8.0),
                  child: Text('My courses (4)',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (ctx, i) {
                        return CourseView(80, true, Get.arguments);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 12.0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        const name = '{"name": "Instructor"}';
                        Get.to(CourseFullListView(),
                            arguments: json.decode(name));
                      },
                      child: Text('See all',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                      style: ButtonStyle(
                          animationDuration: Duration(milliseconds: 0),
                          overlayColor:
                              MaterialStateProperty.all(Colors.grey[900]),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black)),
                    ),
                  ),
                ),
                TwoIconButton(
                  icon1: Icon(FontAwesomeIcons.twitter, color: Colors.white),
                  title: 'Twitter',
                  icon2: Icon(FontAwesomeIcons.arrowRight, color: Colors.white),
                ),
                TwoIconButton(
                  icon1: Icon(FontAwesomeIcons.facebook, color: Colors.white),
                  title: 'Facebook',
                  icon2: Icon(FontAwesomeIcons.arrowRight, color: Colors.white),
                ),
                TwoIconButton(
                  icon1: Icon(FontAwesomeIcons.google, color: Colors.white),
                  title: 'Google',
                  icon2: Icon(FontAwesomeIcons.arrowRight, color: Colors.white),
                )
              ],
            ),
          ),
        ));
  }
}
