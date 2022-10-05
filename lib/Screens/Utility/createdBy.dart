import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Screens/instructor.dart';

class CreatedBy extends StatelessWidget {
  final String e;
  final List list;
  final Map courseData;

  CreatedBy(this.e, this.list, this.courseData);

  Widget getWidget() {
    for (var _ in this.list) {
      if (list.indexOf(this.e) == 0) {
        return InkWell(
          onTap: () {
            Get.to(Instructor(), arguments: courseData);
          },
          child: Text('${this.e}',
              style: TextStyle(color: Colors.blue, fontSize: 14.0)),
        );
      } else if (list.indexOf(this.e) == list.length - 1) {
        return Wrap(
          children: [
            Text(' and ',
                style: TextStyle(color: Colors.white, fontSize: 14.0)),
            InkWell(
              onTap: () {
                Get.to(Instructor(), arguments: courseData);
              },
              child: Text(this.e,
                  style: TextStyle(color: Colors.blue, fontSize: 14.0)),
            ),
          ],
        );
      } else {
        return Wrap(
          children: [
            Text(', ', style: TextStyle(color: Colors.white, fontSize: 14.0)),
            InkWell(
              onTap: () {
                Get.to(Instructor(), arguments: courseData);
              },
              child: Text('${this.e}',
                  style: TextStyle(color: Colors.blue, fontSize: 14.0)),
            ),
          ],
        );
      }
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return getWidget();
  }
}
