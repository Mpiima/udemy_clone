import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemy_clone/Screens/Auth/signIn.dart';
import 'package:udemy_clone/Screens/HomeScreen.dart';
import 'package:udemy_clone/globals.dart' as globals;

class LandBottomBar extends StatelessWidget {
  const LandBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color.fromRGBO(20, 129, 171, 0.8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: MaterialButton(
              elevation: 0,
              height: 55,
              onPressed: () {
                globals.isLoggedIn = false;
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: HomeScreen(),
                        type: PageTransitionType.bottomToTop));
              },
              child: Text(
                'Browse',
                style: TextStyle(color: Colors.grey.shade300, fontSize: 16.0),
              ),
              //  color: Color(0x39a9cb),
            ),
          ),
          Expanded(
            child: MaterialButton(
              elevation: 0,
              height: 55,
              onPressed: () {
                globals.isLoggedIn = true;
                Get.to(SignIn(), transition: Transition.downToUp);
              },
              child: Text(
                'Sign In',
                style: TextStyle(color: Colors.grey.shade300, fontSize: 16.0),
              ),
              //  color: Color(0x39a9cb),
            ),
          ),
        ],
      ),
    );
  }
}
