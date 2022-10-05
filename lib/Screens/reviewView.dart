import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:udemy_clone/Model/reviewModel.dart';

class ReviewView extends StatelessWidget {
  final Review review;

  ReviewView(this.review);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
            child: Text(review.userName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
          RatingBarIndicator(
            rating: review.rating,
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
            padding: const EdgeInsets.only(top: 8.0),
            child:
                Text(review.description, style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
