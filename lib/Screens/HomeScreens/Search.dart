import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:udemy_clone/Screens/Categories.dart';

import '../courseView.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var line = [
    'python',
    'java',
    'javascript',
    'excel',
    'react',
    'sql',
    'aws',
    'unity',
    'wordpress',
    'c#',
    'photoshop',
    'php'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This is handled by the search bar itself.
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Categories(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
                child: Text('Top searches',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              Wrap(
                children: line.map((e) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4),
                    child: TextButton(
                      child: Text(e),
                      onPressed: () {
                        print('button pressed');
                      },
                      style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(12.0)),
                          overlayColor:
                              MaterialStateProperty.all(Colors.grey.shade800),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromRGBO(52, 63, 86, 0.5)),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ))),
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
                child: Text('Browse categories',
                    style: TextStyle(color: Colors.white, fontSize: 22)),
              ),
            ],
          )),
          buildFloatingSearchBar(),
        ],
      ),
    );
  }

  Widget buildFloatingSearchBar() {
    Future<List> getData() async {
      final String response =
          await rootBundle.loadString('assets/courses.json');
      final data = await json.decode(response);
      final rest = data['courses'] as List;
      return rest;
    }

    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      automaticallyImplyBackButton: false,
      accentColor: Colors.white,
      shadowColor: Colors.white,
      backdropColor: Colors.black,
      backgroundColor: Color.fromRGBO(52, 63, 86, 1),
      hint: 'Search...',
      hintStyle: TextStyle(color: Colors.white, fontSize: 18),
      textInputType: TextInputType.text,
      queryStyle: TextStyle(color: Colors.white, fontSize: 18),
      iconColor: Colors.white,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),

      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.black,
            elevation: 4.0,
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
            ),
          ),
        );
      },
    );
  }
}
