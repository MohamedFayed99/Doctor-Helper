import 'package:doctor_helper/pages/auth/register_base_info.dart';
import 'package:doctor_helper/pages/home/home_page.dart';
import 'package:doctor_helper/utils/consts.dart';
import 'package:doctor_helper/widgets/TheTextFormFeild.dart';
import 'package:doctor_helper/widgets/the_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  String email;
  String password;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
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
                top: 35,
                left: 5,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/login_bottom.png',
                  width: size.width * .3,
                ),
              ),
              Form(
                key: globalKey,
                child: SingleChildScrollView(
                  physics: scrollPhysics,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil().setHeight(50),
                      ),
                      Text(
                        'LOGIN to $appName'.toUpperCase().replaceAll(' ', '  '),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                        ),
                      ),
//                  SizedBox(
//                    height: ScreenUtil().setHeight(13),
//                  ),
//                  Image.asset(
//                    'assets/images/login.png',
//                    width: size.width * .45,
//                    height: size.height * .25,
//                    fit: BoxFit.fill,
//                  ),
                      SizedBox(
                        height: ScreenUtil().setHeight(18),
                      ),
                      TheTextFormField(
                        obscureText: false,
                        width: size.width * .9,
                        onSaved: (value) {
                          email = value.trim();
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter email';
                          }  else if(!validateEmail(value)){
                            return 'Enter valid Email';
                          }
                        },
                        hint: 'Your E-mail',
                        prefixIcon: Icon(
                          Icons.email,
                          color: mainColor,
                        ),
                      ),
                      TheTextFormField(
                        width: size.width * .9,
                        obscureText: true,
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.visibility_off,
                            color: mainColor,
                          ),
                          onPressed: () {},
                        ),
                        onSaved: (input) => password = input,
                        validator: (input) {
                          if (input.length < 6) {
                            return 'Longer password please';
                          }
                        },
                        hint: 'Your password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: mainColor,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(15),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(18),
                            vertical: ScreenUtil().setHeight(5),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ForgotPasswordPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Forget  password'.toUpperCase(),
                              style: TextStyle(fontSize: 14, color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                      TheButton(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          if(globalKey.currentState.validate()){
                            globalKey.currentState.save();
                            try {
                              globalKey.currentState.save();
                              final result = await _auth.signInWithEmailAndPassword(
                                  email: email.trim(),
                                  password: password);
                              print(result.user.email);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    settings: RouteSettings(
                                      arguments: email.trim(),
                                    )
                                  )
                              );
                            }
                            catch(e) {
                              setState(() {
                                isLoading = false;
                              });
                              print(e.toString());
                              scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(
                                    e.message
                                ),
                              ));
                            }
                          }
                          setState(() {
                            isLoading=false;
                          });
                        },
                        title: 'LOGIN',
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(48),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(18),
                            vertical: ScreenUtil().setHeight(5),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => RegisterBaseInfo(),
                                ),
                              );
                            },
                            child: Text(
                              'Create  account'.toUpperCase(),
                              style: TextStyle(
                                fontSize: 18,
                                color: mainColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(48),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//  void signIn() async {
//    if(_formKey.currentState.validate()){
//        _formKey.currentState.save();
//        try {
//          _formKey.currentState.save();
//          final result = await _auth.signInWithEmailAndPassword(
//              email: email,
//              password: password);
//          print(result.user.email);
//          Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) => HomePage()));
//        }
//        catch(e) {
//          print(e.toString());
//          scaffoldKey.currentState.showSnackBar(SnackBar(
//            content: Text(
//                e.message
//            ),
//          ));
//        }
//      }
//  }

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }
}
