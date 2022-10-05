import 'package:flutter/material.dart';

class TwoIconButton extends StatelessWidget {
  final String title;

  final Icon icon1;
  final Icon icon2;

  TwoIconButton(
      {required this.title, required this.icon1, required this.icon2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 60,
      child: InkWell(
        radius: 1,
        onTap: () {
          // perform click here
        },
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: icon1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(title,
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: icon2,
              ),
            ]),
      ),
    );
  }
}
