import 'package:doctor_helper/utils/consts.dart';
import 'package:doctor_helper/widgets/TheTextFormFeild.dart';
import 'package:doctor_helper/widgets/the_buttons.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              physics: scrollPhysics,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * .08,
                    ),
                    Image.asset(
                      'assets/images/forgot_password.jpg',
                      fit: BoxFit.fill,
                      height: size.height * .45,
                      width: size.width,
                    ),
                    SizedBox(
                      height: size.height * .05,
                    ),
                    Text(
                      'enter your phone number to search about'
                          .toUpperCase()
                          .replaceAll(' ', '  '),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    TheTextFormField(
                      obscureText: false,
                      width: size.width * .9,
                      onChanged: (String input) {},
                      validator: (String input) {},
                      hint: 'Your phone',
                      prefixIcon: Icon(
                        Icons.phone,
                        color: mainColor,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    TheButton(
                      title: 'Search',
                      onTap: () {},
                    ),
                    SizedBox(
                      height: size.height * .1,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/signup_top.png',
                width: size.width * .3,
              ),
            ),
            Positioned(
              top: 35,
              left: 5,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
