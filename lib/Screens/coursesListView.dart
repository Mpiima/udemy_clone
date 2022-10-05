import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Screens/courseView.dart';

class CourseFullListView extends StatelessWidget {
  const CourseFullListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List> getData() async {
      final String response =
          await rootBundle.loadString('assets/courses.json');
      final data = await json.decode(response);
      final rest = data['courses'] as List;
      return rest;
    }

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(Get.arguments['name'],
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))),
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
        ));
  }
}
