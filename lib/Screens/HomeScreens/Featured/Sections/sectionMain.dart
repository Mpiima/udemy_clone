import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:udemy_clone/Screens/DetailSection/DetailSection.dart';
import 'package:udemy_clone/Screens/DetailSection/categoryDetail.dart';

class SectionMain extends StatelessWidget {
  final String sectionName;
  final String sectionButtonName;
  final double viewHeight;
  final double viewWidth;
  final double imageSize;
  final List courseData;

  SectionMain(
      {required this.sectionName,
      required this.sectionButtonName,
      required this.viewHeight,
      required this.viewWidth,
      required this.imageSize,
      required this.courseData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 8.0, bottom: 8.0),
          child: FittedBox(
            child: Row(
              children: [
                Text(sectionName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
                sectionButtonName != ''
                    ? TextButton(
                        onPressed: () {
                          Get.to(CategoryDetail(),
                              arguments: sectionButtonName);
                        },
                        child: Text(sectionButtonName,
                            style: TextStyle(
                                fontSize: 22.0, color: Colors.blueAccent)),
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent)),
                      )
                    : Container()
              ],
            ),
          ),
        ),
        SizedBox(
            height: viewHeight,
            width: double.infinity,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: courseData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      radius: 1,
                      onTap: () {
                        Get.to(DetailedScreen(),
                            transition: Transition.leftToRightWithFade,
                            arguments: courseData[index]);
                      },
                      child: Container(child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: viewWidth,
                                  height: viewHeight * imageSize,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              courseData[index]['image']),
                                          fit: BoxFit.fill))),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: viewWidth,
                                  ),
                                  child: Text(courseData[index]['name'],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: 18.0)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: viewWidth,
                                  ),
                                  child: Text(
                                      courseData[index]['createdBy'].join(', '),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12.0)),
                                ),
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: courseData[index]['rating'],
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
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Text(
                                        courseData[index]['rating'].toString(),
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14.0)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.0),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: viewWidth * 0.35,
                                      ),
                                      child: Text(
                                        '(' +
                                            NumberFormat("##,###", "en_US")
                                                .format(courseData[index]
                                                    ['totalRatings']) +
                                            ')',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Row(
                                  children: [
                                    Icon(FontAwesomeIcons.dollarSign,
                                        color: Colors.white, size: 15),
                                    Text(
                                        courseData[index]['discountPrice']
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0)),
                                    courseData[index]['discounted']
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: RichText(
                                              text: TextSpan(
                                                  children: [
                                                    WidgetSpan(
                                                        child: Icon(
                                                            FontAwesomeIcons
                                                                .dollarSign,
                                                            color: Colors
                                                                .grey.shade500,
                                                            size: 12),
                                                        alignment:
                                                            PlaceholderAlignment
                                                                .middle),
                                                    TextSpan(
                                                      text: "94.99",
                                                    ),
                                                  ],
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      color:
                                                          Colors.grey.shade500,
                                                      fontSize: 12.0)),
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                              courseData[index]['bestseller']
                                  ? Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4.0, left: 2),
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.yellow[300],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 5.0),
                                            child: Text('Bestseller',
                                                style: TextStyle(
                                                    color: Colors.brown,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )),
                                    )
                                  : Container(),
                            ],
                          );
                        },
                      )),
                    ),
                  );
                }))
      ],
    );
  }
}
