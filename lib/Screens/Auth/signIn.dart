import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Screens/Auth/signInWithEmail.dart';
import './signUp.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  'Sign in',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.to(SignInWithEmail(),
                          transition: Transition.rightToLeft);
                    },
                    icon: Icon(
                      Icons.email,
                      color: Colors.red,
                    ),
                    label: Text('Sign in with email'),
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
                        label: Text('Sign in with Google'),
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
                        label: Text('Sign in with Facebook'),
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
                          FontAwesomeIcons.apple,
                          color: Colors.red,
                        ),
                        label: Text('Sign in with Apple'),
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
                    'New here?',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(SignUp(), transition: Transition.rightToLeft);
                      },
                      child: Text('Create an Account',
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
