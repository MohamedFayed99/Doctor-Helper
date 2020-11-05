import 'package:doctor_helper/pages/auth/register_waiting_page.dart';
import 'package:doctor_helper/utils/consts.dart';
import 'package:doctor_helper/widgets/my_pin_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class VerifyPhonePage extends StatefulWidget {
  @override
  _VerifyPhonePageState createState() => _VerifyPhonePageState();
}

class _VerifyPhonePageState extends State<VerifyPhonePage> {
  bool isStart = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => RegisterWaitingPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/signup_top.png',
                width: size.width * .3,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: RotatedBox(
                quarterTurns: 3,
                child: Image.asset(
                  'assets/images/signup_top.png',
                  width: size.width * .15,
                ),
              ),
            ),
            SingleChildScrollView(
              physics: scrollPhysics,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setHeight(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * .1,
                    ),
                    Text(
                      'We sent you a code to verify your phone number please type it'
                          .toUpperCase()
                          .replaceAll(' ', '  '),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: mainColor,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Image.asset(
                      'assets/images/verify.png',
                      width: size.width,
                      height: size.height * .55,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(8),
                      ),
                      child: MyPinCodeTextField(
                        length: 6,
                        obsecureText: false,
                        animationType: AnimationType.fade,
                        shape: PinCodeFieldShape.box,
                        animationDuration: Duration(milliseconds: 300),
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        borderWidth: 1.0,
                        affirmativeText: 'Past code',
                        textStyle: TextStyle(
                          color: mainColor,
                        ),
                        animationCurve: Curves.easeInOut,
                        dialogTitle: 'Past Code',
                        backgroundColor: Colors.transparent,
                        selectedColor: mainColor,
                        inactiveColor: mainColor,
                        textInputType: TextInputType.phone,
                        activeColor: mainColor,
                        onCompleted: (input) async {},
                        onChanged: (value) {},
                      ),
                    ),
                    isStart
                        ? Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              backgroundColor: mainColor,
                            ),
                          )
                        : SizedBox.shrink(),
                    SizedBox(
                      height: size.height * .01,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
