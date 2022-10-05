import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RatingStatistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('4.5',
                  style: TextStyle(color: Colors.white, fontSize: 22)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('course rating',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 160,
            animation: true,
            animationDuration: 1000,
            lineHeight: 20.0,
            trailing: Row(
              children: [
                RatingBarIndicator(
                  rating: 5,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  unratedColor: Colors.grey,
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('52%', style: TextStyle(color: Colors.white)),
                )
              ],
            ),
            percent: 0.5,
            linearStrokeCap: LinearStrokeCap.butt,
            progressColor: Colors.grey,
            backgroundColor: Colors.grey.shade600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 160,
            animation: true,
            animationDuration: 1000,
            lineHeight: 20.0,
            trailing: Row(
              children: [
                RatingBarIndicator(
                  rating: 4,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  unratedColor: Colors.grey,
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('30%', style: TextStyle(color: Colors.white)),
                )
              ],
            ),
            percent: 0.3,
            linearStrokeCap: LinearStrokeCap.butt,
            progressColor: Colors.grey,
            backgroundColor: Colors.grey.shade600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 160,
            animation: true,
            animationDuration: 1000,
            lineHeight: 20.0,
            trailing: Row(
              children: [
                RatingBarIndicator(
                  rating: 3,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  unratedColor: Colors.grey,
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('10%', style: TextStyle(color: Colors.white)),
                )
              ],
            ),
            percent: 0.1,
            linearStrokeCap: LinearStrokeCap.butt,
            progressColor: Colors.grey,
            backgroundColor: Colors.grey.shade600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 160,
            animation: true,
            animationDuration: 1000,
            lineHeight: 20.0,
            trailing: Row(
              children: [
                RatingBarIndicator(
                  rating: 2,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  unratedColor: Colors.grey,
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('5%', style: TextStyle(color: Colors.white)),
                )
              ],
            ),
            percent: 0.05,
            linearStrokeCap: LinearStrokeCap.butt,
            progressColor: Colors.grey,
            backgroundColor: Colors.grey.shade600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 160,
            animation: true,
            animationDuration: 1000,
            lineHeight: 20.0,
            trailing: Row(
              children: [
                RatingBarIndicator(
                  rating: 1,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  unratedColor: Colors.grey,
                  itemCount: 5,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('1%', style: TextStyle(color: Colors.white)),
                )
              ],
            ),
            percent: 0.01,
            linearStrokeCap: LinearStrokeCap.butt,
            progressColor: Colors.grey,
            backgroundColor: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
