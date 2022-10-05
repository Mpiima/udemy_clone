import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:udemy_clone/Model/reviewModel.dart';
import 'package:udemy_clone/Screens/CurriculumList.dart';
import 'package:udemy_clone/Screens/ReviewsPage.dart';
import 'package:udemy_clone/Screens/Utility/createdBy.dart';
import 'package:udemy_clone/Screens/courseView.dart';
import 'package:udemy_clone/Screens/instructorView.dart';
import 'package:udemy_clone/Screens/ratingStatistics.dart';
import 'package:udemy_clone/Screens/reviewView.dart';
import 'package:udemy_clone/Screens/coursesListView.dart';

class DetailedScreen extends StatefulWidget {
  const DetailedScreen({Key? key}) : super(key: key);

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  bool showmore = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.23,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(Get.arguments['image']),
                                    fit: BoxFit.fitWidth,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black26, BlendMode.darken)))),
                        Container(
                          width: double.infinity,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(),
                                Icon(Icons.play_arrow,
                                    color: Colors.white, size: 80),
                                Text('Preview this course',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              ]),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 2.0),
                child: Text(Get.arguments['name'],
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
                child: Text(Get.arguments['shortDescription'],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.6),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold)),
              ),
              Get.arguments['bestseller']
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.yellow[300],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Bestseller',
                                style: TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold)),
                          )),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Text(Get.arguments['rating'].toString(),
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.0)),
                    ),
                    RatingBarIndicator(
                      rating: Get.arguments['rating'],
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      unratedColor: Colors.grey,
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        '(' +
                            NumberFormat("##,###", "en_US")
                                .format(Get.arguments['totalRatings']) +
                            ')',
                        style: TextStyle(color: Colors.white, fontSize: 14.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        '${NumberFormat("##,###", "en_US").format(Get.arguments['totalStudents'])} students',
                        style: TextStyle(color: Colors.white, fontSize: 14.0)),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: Container(
                  width: double.infinity,
                  child: Wrap(children: [
                    Text('Created by ',
                        style: TextStyle(color: Colors.white, fontSize: 14.0)),
                    for (var e in Get.arguments['createdBy'])
                      CreatedBy(e, Get.arguments['createdBy'], Get.arguments)
                  ]),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: RichText(
                      text: TextSpan(children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.announcement_sharp,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),
                        TextSpan(text: '  Last updated 5/2021'),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: RichText(
                      text: TextSpan(children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.language_outlined,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),
                        TextSpan(text: '  English'),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: RichText(
                      text: TextSpan(children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.closed_caption,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),
                        TextSpan(
                            text:
                                '  ${Get.arguments['subtitleLanguages'].join(', ')}'),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.dollarSign,
                            color: Colors.white, size: 20),
                        Text(Get.arguments['discountPrice'].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        Get.arguments['discounted']
                            ? Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: RichText(
                                  textAlign: TextAlign.end,
                                  text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                            child: Icon(
                                                FontAwesomeIcons.dollarSign,
                                                color: Colors.grey.shade500,
                                                size: 14),
                                            alignment:
                                                PlaceholderAlignment.middle),
                                        TextSpan(
                                          text: Get.arguments['originalPrice']
                                              .toString(),
                                        ),
                                      ],
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey.shade500,
                                          fontSize: 14.0)),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(children: [
                        WidgetSpan(
                          child: Icon(Icons.alarm_on,
                              size: 20, color: Colors.red[400]),
                        ),
                        TextSpan(
                            text: ' 86% off - 9 hours left at this price!',
                            style: TextStyle(
                                fontSize: 16, color: Colors.red[400])),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Buy Now',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.grey),
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(50, 91, 133, 1)),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Add to Cart',
                            style: TextStyle(
                                color: Color.fromRGBO(50, 91, 133, 1),
                                fontSize: 16.0,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 18.0, left: 8.0),
                            child: Text(
                              'What you\'ll learn',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: showmore ? 10 : 4,
                              itemBuilder: (ctx, i) {
                                return ListTile(
                                  leading: Icon(Icons.check_sharp,
                                      color: Colors.grey),
                                  title: Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: Text(
                                      'Learn C# from scratch. A powerful modern language.',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              }),
                          showmore
                              ? MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      showmore = false;
                                    });
                                  },
                                  child: Text('SHOW LESS',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 12.0)),
                                )
                              : MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      showmore = true;
                                    });
                                  },
                                  child: Text('SHOW MORE',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 12.0)),
                                )
                        ]),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 8.0),
                child: Text(
                  'Curriculum',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                    itemCount: 6,
                    itemBuilder: (ctx, i) {
                      return ExpansionTile(
                        initiallyExpanded: i == 0 ? true : false,
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
                                            color: Colors.white,
                                            fontSize: 18.0)),
                                    title: Text(
                                        'What you\'re going to get from this course',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0)),
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
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 12.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(CurriculumList(), arguments: Get.arguments);
                    },
                    child: Text('16 more sections',
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
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, bottom: 8.0, left: 8.0),
                child: Text(
                  'This course includes',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.play_lesson,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(text: '  30.5 total hours on-demand video'),
                  ]),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.storm_rounded,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(text: '  20 Quizzes'),
                  ]),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.document_scanner,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(text: '  Support Files'),
                  ]),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.book_outlined,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(text: '  3 Articles'),
                  ]),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.loop_outlined,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(text: '  Full lifetime access'),
                  ]),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.phone_android,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(text: '  Access on mobile, desktop, and TV'),
                  ]),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: RichText(
                  text: TextSpan(children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.book_outlined,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(text: '  Certificate of Completion'),
                  ]),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Text(
                  'Requirements',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (ctx, i) {
                    return ListTile(
                      leading: Container(
                        height: 10,
                        width: 10,
                        decoration: new BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      title: Transform.translate(
                        offset: Offset(-20, 0),
                        child: Text(
                            'You should have a basic experience as a manager.',
                            style: TextStyle(color: Colors.white)),
                      ),
                    );
                  }),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, top: 20.0, bottom: 8.0),
                child: Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: ExpandableText(
                  'Jose Marcial Portilla has a BS and MS in Mechanical Engineering from Santa Clara University and years of experience as a professional instructor and trainer for Data Science and programming. He has publications and patents in various fields such as microfluidics, materials science, and data science technologies. Over the course of his career he has developed a skill set in analyzing data and he hopes to use his experience in teaching and data science to help other people learn the power of programming the ability to analyze data, as well as present the data in clear and beautiful visualizations. Currently he works as the Head of Data Science for Pierian Data Inc. and provides in-person data science and python programming training courses to employees working at top companies, including General Electric, Cigna, The New York Times, Credit Suisse, McKinsey and many more. Feel free to contact him on LinkedIn for more information on in-person training sessions or group training sessions in Las Vegas, NV.',
                  expandText: '\n\nSHOW MORE',
                  collapseText: '\nSHOW LESS',
                  maxLines: 7,
                  linkColor: Colors.blue,
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, top: 18.0, bottom: 8.0),
                child: Text(
                  'Students also bought',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (ctx, i) {
                  return CourseView(
                      80, Get.arguments['bestseller'], Get.arguments);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 12.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      print(Get.arguments['name']);
                      Get.to(CourseFullListView(), arguments: Get.arguments);
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Text(
                  'Instructors',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: Get.arguments['createdBy'].length,
                itemBuilder: (ctx, i) {
                  return InstructorView(Get.arguments);
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Text(
                  'Student Feedback',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              RatingStatistics(),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (ctx, i) {
                    return ReviewView(reviewsList[i]);
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 12.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(ReviewsPage(), arguments: Get.arguments);
                    },
                    child: Text('See More Reviews',
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
            ],
          ),
        ),
      ),
    );
  }
}
