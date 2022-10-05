import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemy_clone/Screens/Auth/signIn.dart';
import 'package:udemy_clone/Screens/HomeScreen.dart';

class ForgotPasswordResult extends StatefulWidget {
  const ForgotPasswordResult({Key? key}) : super(key: key);

  @override
  _ForgotPasswordResultState createState() => _ForgotPasswordResultState();
}

class _ForgotPasswordResultState extends State<ForgotPasswordResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.check_sharp, color: Colors.grey, size: 60),
                  Text('Success!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                  Text(
                      'we have sent a link to example@email.com to reset your password. Once you have updated your information you can try again.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Didn\'t get it?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text('Send it again',
                                style: TextStyle(color: Colors.white))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/landingpageb.jpg'),
                  fit: BoxFit.fitHeight,
                  colorFilter:
                      ColorFilter.mode(Colors.white, BlendMode.darken)),
            )),
        bottomNavigationBar: BottomAppBar(
          color: Colors.red[400],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: MaterialButton(
                  elevation: 0,
                  height: 55,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: HomeScreen(),
                            type: PageTransitionType.rightToLeft));
                  },
                  child: Text(
                    'Browse',
                    style:
                        TextStyle(color: Colors.grey.shade300, fontSize: 16.0),
                  ),
                  //  color: Color(0x39a9cb),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  elevation: 0,
                  height: 55,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: SignIn(),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: Text(
                    'Sign In',
                    style:
                        TextStyle(color: Colors.grey.shade300, fontSize: 16.0),
                  ),
                  //  color: Color(0x39a9cb),
                ),
              ),
            ],
          ),
        ));
  }
}
