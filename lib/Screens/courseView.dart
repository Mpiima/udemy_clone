import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:udemy_clone/Screens/DetailSection/DetailSection.dart';

class CourseView extends StatelessWidget {
  final double imageSize;
  final bool bestseller;
  final Map courseData;

  CourseView(this.imageSize, this.bestseller, this.courseData);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 1,
      onTap: () {
        Get.to(DetailedScreen(),
            transition: Transition.leftToRightWithFade, arguments: courseData);
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ListTile(
          leading: Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: AssetImage(courseData['image']), fit: BoxFit.cover),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 6.0),
            child: Text(courseData['name'],
                overflow: TextOverflow.visible,
                maxLines: 2,
                style: TextStyle(color: Colors.grey.shade400, fontSize: 18.0)),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text(courseData['createdBy'].join(', '),
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 12.0)),
              ),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: courseData['rating'],
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    unratedColor: Colors.grey,
                    itemCount: 5,
                    itemSize: 18.0,
                    direction: Axis.horizontal,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(courseData['rating'].toString(),
                        style:
                            TextStyle(color: Colors.white70, fontSize: 14.0)),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth:
                          MediaQuery.of(context).size.width < 350 ? 50 : 80,
                    ),
                    child: Text(
                        '(' +
                            NumberFormat("##,###", "en_US")
                                .format(courseData['totalRatings']) +
                            ')',
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(color: Colors.white70, fontSize: 14.0)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: RichText(
                    text: TextSpan(children: [
                  WidgetSpan(
                      child: Icon(FontAwesomeIcons.dollarSign,
                          color: Colors.white, size: 12),
                      alignment: PlaceholderAlignment.middle),
                  TextSpan(
                    text: courseData['discountPrice'].toString(),
                  ),
                ])),
              ),
              bestseller == true
                  ? Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 2),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.yellow[300],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5.0),
                            child: Text('Bestseller',
                                style: TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold)),
                          )),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
