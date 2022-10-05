import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Model/reviewModel.dart';
import 'package:udemy_clone/Screens/reviewView.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('${Get.arguments['name']}',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(top: 8.0),
                alignment: Alignment.center,
                child: Text('Reviews',
                    style: TextStyle(color: Colors.grey, fontSize: 18))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('4.7',
                    style: TextStyle(color: Colors.white, fontSize: 36)),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: RatingBarIndicator(
                          rating: 5,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          unratedColor: Colors.grey,
                          itemCount: 5,
                          itemSize: 18.0,
                          direction: Axis.horizontal,
                        ),
                      ),
                      Text('33,017 Ratings',
                          style: TextStyle(color: Colors.grey, fontSize: 12))
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: reviewsList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ReviewView(
                    reviewsList[index],
                  );
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
