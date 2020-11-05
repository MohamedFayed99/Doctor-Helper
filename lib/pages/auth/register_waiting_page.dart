import 'package:doctor_helper/pages/auth/register_finished_page.dart';
import 'package:flutter/material.dart';

class RegisterWaitingPage extends StatefulWidget {
  @override
  _RegisterWaitingPageState createState() => _RegisterWaitingPageState();
}

class _RegisterWaitingPageState extends State<RegisterWaitingPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => RegisterFinishedPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffD3F1FF),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/waiting.gif',
              fit: BoxFit.fill,
              height: size.height * .5,
              width: size.width,
            ),
            SizedBox(
              height: size.height * .1,
            ),
            Text(
              'START CREATING THE ACCOUNT\n\nPLEASE BE PATIENT'
                  .toUpperCase()
                  .replaceAll(' ', '  '),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
