import 'package:doctor_helper/pages/auth/login.dart';
import 'package:doctor_helper/utils/consts.dart';
import 'package:doctor_helper/widgets/the_buttons.dart';
import 'package:flutter/material.dart';

class RegisterFinishedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff4A148C),
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          physics: scrollPhysics,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: size.height * .08,
              ),
              Text(
                '$appName'.toUpperCase().replaceAll(' ', '  '),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: size.height * .05,
              ),
              Image.asset(
                'assets/images/joined.jpg',
                fit: BoxFit.fill,
                height: size.height * .55,
                width: size.width,
              ),
              SizedBox(
                height: size.height * .03,
              ),
              Text(
                'Account created successfully\nnow you Joined to our doctors staff'
                    .toUpperCase()
                    .replaceAll(' ', '  '),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: size.height * .03,
              ),
              TheButton(
                title: 'Start  working'.toUpperCase(),
                backgroundColor: Colors.white,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginPage(),
                    ),
                  );
                },
                textColor: mainColor,
              ),
              SizedBox(
                height: size.height * .1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
