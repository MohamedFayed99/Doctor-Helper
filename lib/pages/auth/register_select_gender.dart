import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_helper/pages/auth/auth_location_picker.dart';
import 'package:doctor_helper/utils/consts.dart';
import 'package:doctor_helper/widgets/the_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:gender_selection/gender_selection.dart';

class RegisterSelectGender extends StatefulWidget {
  @override
  _RegisterSelectGenderState createState() => _RegisterSelectGenderState();
}

class _RegisterSelectGenderState extends State<RegisterSelectGender> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Gender selectedGender;

  String specialist = 'Select your specialist';
  List<String> specialists = ['Heart', 'Stomach', 'Dentist'];
  final _database = FirebaseFirestore.instance;
  // String user = widget.id;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userId = ModalRoute.of(context).settings.arguments;
    //print();
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: RotatedBox(
                quarterTurns: 3,
                child: Image.asset(
                  'assets/images/login_bottom.png',
                  width: size.width * .7,
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
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: scrollPhysics,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.height * .2,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(18),
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'SELECT YOUR GENDER'.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    GenderSelection(
                      maleText: "Male",
                      femaleImage: AssetImage('assets/images/female.jpg'),
                      maleImage: AssetImage('assets/images/male.png'),
                      femaleText: "Female",
                      linearGradient: LinearGradient(
                        colors: [mainColor,secondColor]
                      ),
                      selectedGenderIconBackgroundColor: Colors.indigo,
                      checkIconAlignment: Alignment.bottomCenter,
                      selectedGenderCheckIcon: Icons.check,
                      selectedGenderTextStyle: TextStyle(
                        color: mainColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      unSelectedGenderTextStyle: TextStyle(
                        fontSize: 16,
                      ),
                      onChanged: (Gender gender) {
                        selectedGender = gender;
                      },
                      equallyAligned: true,
                      animationDuration: Duration(milliseconds: 400),
                      // default : true,
                      isSelectedGenderIconCircular: true,
                      opacityOfGradient: 0.5,
                      padding: const EdgeInsets.all(3),
                      size: ScreenUtil().setHeight(120),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(80),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(18),
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'SELECT YOUR Specialist'.toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(20),
                        vertical: ScreenUtil().setHeight(20),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: secondColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(10),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: DropdownButton<String>(
                              elevation: 8,
                              focusColor: mainColor,
                              isExpanded: true,
                              hint: Text(
                                '$specialist',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: mainColor,
                                  fontWeight:
                                      specialist == 'Select your specialist'
                                          ? null
                                          : FontWeight.bold,
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              items: specialists.map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        value,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                              onChanged: (item) {
                                setState(
                                  () {
                                    specialist = item;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(30),
                    ),
                    TheButton(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          try {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              await _database.collection("users").doc(userId).update({
                                'gender': selectedGender.toString(),
                                'specialist': specialist,
                                //  'email': email,
                                // 'password': password
                              });
                            }
                          } catch (e) {
                            print(e);
                          }
                          print('the user id is : $userId');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => AuthLocationPicker(),
                              settings: RouteSettings(
                                arguments: userId,
                              ),
                            ),
                          );
                        }
                      },
                      title: 'NEXT',
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(170),
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

//  void updateRecord() async {
//    try {
//      if (_formKey.currentState.validate()) {
//        _formKey.currentState.save();
//        await _database.collection("users").doc().update({
//          'gender': selectedGender.toString(),
//          'specialist': specialist,
//          //  'email': email,
//          // 'password': password
//        });
//      }
//    } catch (e) {
//      print(e);
//    }
//  }
}
