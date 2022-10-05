import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemy_clone/Screens/Auth/signInWithEmail.dart';
import 'package:udemy_clone/Screens/Auth/signUpWithEmail.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Text(
                  'Create an account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.to(SignUpWithEmail(),
                          transition: Transition.rightToLeft);
                    },
                    icon: Icon(
                      Icons.email,
                      color: Colors.red,
                    ),
                    label: Text('Sign Up with email'),
                    style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.grey),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: (MediaQuery.of(context).size.width / 2) - 30,
                        child: Divider(
                          color: Colors.white,
                        )),
                    Text('or', style: TextStyle(color: Colors.white)),
                    SizedBox(
                        width: (MediaQuery.of(context).size.width / 2) - 30,
                        child: Divider(
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.google,
                          color: Colors.red,
                        ),
                        label: Text('Sign Up with Google'),
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.grey),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.facebook,
                          color: Colors.red,
                        ),
                        label: Text('Sign Up with Facebook'),
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.grey),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black)),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: SignInWithEmail(),
                                type: PageTransitionType.fade));
                      },
                      child: Text('Sign in',
                          style: TextStyle(color: Colors.white))),
                ],
              ),
              Center(
                child: Text(
                  'By Continuing, you agreed our Terms of Service. Privacy\nPolicy. and our default User & Notification Settings.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ],
          )),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/landingpageb.jpg'),
                fit: BoxFit.fitHeight,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.darken)),
          )),
    );
  }
}
