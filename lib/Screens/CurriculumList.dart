import 'package:flutter/material.dart';

class CurriculumList extends StatelessWidget {
  const CurriculumList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 16.0),
              child: Text(
                'Curriculum',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(text: '101 sections '),
                  WidgetSpan(
                      child: Icon(
                        Icons.circle,
                        color: Colors.grey,
                        size: 5,
                      ),
                      alignment: PlaceholderAlignment.middle),
                  TextSpan(text: ' 675 lectures '),
                  WidgetSpan(
                      child: Icon(
                        Icons.circle,
                        color: Colors.grey,
                        size: 5,
                      ),
                      alignment: PlaceholderAlignment.middle),
                  TextSpan(text: ' 63h 41m total length'),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 22,
                  itemBuilder: (ctx, i) {
                    return ExpansionTile(
                      expandedAlignment: Alignment.topLeft,
                      childrenPadding: EdgeInsets.only(left: 16.0),
                      trailing: Icon(Icons.add, color: Colors.blue),
                      title: Text(
                          'Section 1 - Day 1 - Beginner - Working with Variables in Python to Manage Data',
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 15.0)),
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (ctx, i) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: ListTile(
                                  leading: Text((i + 1).toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.0)),
                                  title: Text(
                                      'What you\'re going to get from this course',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.0)),
                                  subtitle: Row(
                                    children: [
                                      Text('Video - 03:27 mins',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.0)),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Icon(Icons.closed_caption,
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  trailing: Icon(
                                      Icons.play_circle_fill_outlined,
                                      color: Colors.blue),
                                ),
                              );
                            })
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
