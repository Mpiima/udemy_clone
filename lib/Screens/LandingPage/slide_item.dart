import 'package:flutter/material.dart';
import 'package:udemy_clone/Model/slideModel.dart';

class SlideItem extends StatelessWidget {
  final int index;

  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            width: double.infinity,
            child: SizedBox(
                height: 300,
                child: Image.asset(
                    'images/${slideList[index].imageUrl.toString()}'))),
        SizedBox(
          height: 40,
        ),
        Text(
          slideList[index].title,
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(slideList[index].description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey)),
      ],
    );
  }
}
