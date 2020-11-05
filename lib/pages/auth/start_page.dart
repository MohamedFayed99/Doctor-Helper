import 'package:doctor_helper/pages/auth/login.dart';
import 'package:doctor_helper/pages/auth/register_base_info.dart';
import 'package:doctor_helper/utils/consts.dart';
import 'package:doctor_helper/widgets/the_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/main_top.png',
                width: size.width * .3,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                'assets/images/main_bottom.png',
                width: size.width * .2,
              ),
            ),
            SingleChildScrollView(
              physics: scrollPhysics,
              child: Column(
                children: <Widget>[
                  Text(
                    'WELCOME TO $appName'.toUpperCase().replaceAll(' ', '  '),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(13),
                  ),
                  Image.asset(
                    'assets/images/login_signup.png',
                    width: size.width * .8,
                    height: size.height * .4,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(18),
                  ),
                  TheButton(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => LoginPage(),
                        ),
                      );
                    },
                    title: 'LOGIN',
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(13),
                  ),
                  TheButton(
                    title: 'REGISTER',
                    backgroundColor: secondColor,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => RegisterBaseInfo(),
                        ),
                      );
                    },
                    textColor: mainColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
