import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_helper/pages/auth/login.dart';
import 'package:doctor_helper/pages/auth/register_select_gender.dart';
import 'package:doctor_helper/utils/consts.dart';
import 'package:doctor_helper/widgets/TheTextFormFeild.dart';
import 'package:doctor_helper/widgets/the_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterBaseInfo extends StatefulWidget {
  @override
  _RegisterBaseInfoState createState() => _RegisterBaseInfoState();
}

class _RegisterBaseInfoState extends State<RegisterBaseInfo> {

  String username, email, password, phone;
  var isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  _RegisterBaseInfoState();

  // to show message in error statu
  void _showErrorDialog(String message) {
    showDialog(
      context: this.context,
      builder: (ctx) => AlertDialog(
        title: Text("An Error Occurred!"),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text("okay"),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  // bool validateAndSave() {
  //   final form = formKey.currentState;
  //   if (form.validate()) {
  //     form.save();
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // void validateAndSubmit() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //
  //   if (validateAndSave()) {
  //     try {
  //       User user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //           email: email, password: password)) as User;
  //       if (user.uid != null) {
  //         userId = user.uid;
  //         await _database.reference().child("customers").child(user.uid).set({
  //           "email": "dddddd",
  //           "name": "dddddddddddaasd",
  //         });
  //
  //         // Navigator.of(this.context).push(new MaterialPageRoute(
  //         //     builder: (context) => new PhoneNumberConfirmation(
  //         //         auth: widget.auth,
  //         //         newCustomerID: userId,
  //         //        onSignedIn: widget.onSignedIn,
  //         //         password: password)));
  //       } else {
  //         String errorMessage;
  //       }
  //     } catch (error) {
  //       String errorMessage;
  //
  //       errorMessage = error;
  //
  //       _showErrorDialog(errorMessage);
  //     }
  //   }
  //
  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String userId;
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
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/login_bottom.png',
                  width: size.width * .4,
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
              Form(
                key: formKey,
                child: SingleChildScrollView(
                  physics: scrollPhysics,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil().setHeight(50),
                      ),
                      Text(
                        'CREATE NEW ACCOUNT'.toUpperCase().replaceAll(' ', '  '),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(50),
                      ),
                      TheTextFormField(
                        obscureText: false,
                        width: size.width * .9,
                        onSaved: (value) => username = value,
                        validator: (input) {
                          if (input.length < 3) return 'Longer name please';
                        },
                        hint: 'Your name',
                        prefixIcon: Icon(
                          Icons.person,
                          color: mainColor,
                        ),
                      ),
                      TheTextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        width: size.width * .9,
                        onSaved: (value) => phone = value,
                        validator: (input) {
                          if (input.length < 6) return 'Correct number please';
                        },
                        hint: 'Your phone',
                        prefixIcon: Icon(
                          Icons.phone,
                          color: mainColor,
                        ),
                      ),
                      TheTextFormField(
                        obscureText: false,
                        width: size.width * .9,
                        onSaved: (value) => email = value,
                        validator: (input) {
                          if (!validateEmail(input)) {
                            return 'enter valid email';
                          }
                        },
                        hint: 'Your email',
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
                        onSaved: (value) => password = value,
                        validator: (input) {
                          if (input.length < 6) return 'Longer password please';
                        },
                        hint: 'Your password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: mainColor,
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(14),
                      ),
                      TheButton(
                        onTap: () async {
                            setState(() {
                              isLoading = true;
                            });
                            if(formKey.currentState.validate()){
                              try {
                                formKey.currentState.save();
                                final result = await _auth.createUserWithEmailAndPassword(
                                    email: email.trim(), password: password);
                                print(result.user.email);
                                print(result.user.uid); //auth doc id
                                 DocumentReference reference = await FirebaseFirestore.instance.collection("users").add({
                                   'name': username,
                                   'phone': phone,
                                   'gender': ' ',
                                   'specialist': ' ',
                                   'email' : email,
                                 });
                                 userId = reference.id;
                                print("ccccccccccccccccccccccccccccccccccccccccc " + userId);

                              print('User id : $userId'); // firestore doc id
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => RegisterSelectGender(),
                                    settings: RouteSettings(
                                      arguments: userId,
                                    ),
                                  ),
                                );
                              } catch(e){
                                print(e.toString());
                                scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text(
                                      e.message
                                  ),
                                ));
                              }
                            }
                            setState(() {
                              isLoading = false;
                            });
                            },

                        title: 'NEXT',
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(18),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(18),
                            vertical: ScreenUtil().setHeight(5),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => LoginPage(),
                                ),
                              );
                            },
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(18),
                                  vertical: ScreenUtil().setHeight(15),
                                ),
                                child: Text(
                                  'Have account ?  login'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: mainColor,
                                  ),
                                ),
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

//  void signUp() async {
//      if (formKey.currentState.validate()) {
//        formKey.currentState.save();
//
//        try {
//          User user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//              email: email.trim(), password: password) as User;
//          print(email + password);
//        } catch (e) {
//          print(e);
//        }
//      }
//  }

//  void createRecord() async {
//    DocumentReference reference = await FirebaseFirestore.instance.collection("users").add({
//      'name': username,
//      'phone': phone,
//      'gender': ' ',
//      'specialist': ' ',
//    });
//    userId = reference.id;
//    print("ccccccccccccccccccccccccccccccccccccccccc " + userId);
//  }

  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }
}
