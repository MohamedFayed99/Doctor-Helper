import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_helper/pages/auth/verify_phone_page.dart';
import 'package:doctor_helper/painters_and_clips/paint_1.dart';
import 'package:doctor_helper/utils/consts.dart';
import 'package:doctor_helper/widgets/the_buttons.dart';
import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class DetermineWorksDateTime extends StatefulWidget {
  @override
  _DetermineWorksDateTimeState createState() => _DetermineWorksDateTimeState();
}

class _DetermineWorksDateTimeState extends State<DetermineWorksDateTime> {
  bool satarday = false;
  bool sunday = false;
  bool monday = false;
  bool tuesday = false;
  bool wednesday = false;
  bool thursday = false;
  bool friday = false;

  String _satarday = '',
      _sunday = '',
      _monday = '',
      _tuesday = '',
      _wednesday = '',
      _thursday = '',
      _friday = '';

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
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: size.height * .095,
                  ),
                  Text(
                    'Determine your works time'.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(25),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: CheckboxListTile(
                            subtitle: Text(_satarday),
                            activeColor: mainColor,
                            title: Text(
                              'Saturday',
                              style: TextStyle(color: Colors.black),
                            ),
                            value: satarday,
                            dense: true,
                            checkColor: Colors.white,
                            onChanged: (bool val) {
                              satarday = val;

                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(18),
                        ),
                        RaisedButton(
                          onPressed: satarday
                              ? () {
                                  DateTimeRangePicker(
                                    startText: "From",
                                    endText: "To",
                                    doneText: "Yes",
                                    cancelText: "Cancel",
                                    interval: 1,
                                    initialStartTime: DateTime.now(),
                                    initialEndTime: DateTime.now().add(
                                      Duration(days: 20),
                                    ),
                                    mode: DateTimeRangePickerMode.time,
                                    onConfirm: (start, end) {
                                      _satarday =
                                          'FROM: ${start.hour}:${start.minute}   TO: ${end.hour}:${end.minute}';
                                      setState(() {});
                                    },
                                  ).showPicker(context);
                                }
                              : null,
                          child: Text('Time'),
                          color: mainColor,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: CheckboxListTile(
                            subtitle: Text(_sunday),
                            activeColor: mainColor,
                            title: Text(
                              'Sunday',
                              style: TextStyle(color: Colors.black),
                            ),
                            value: sunday,
                            dense: true,
                            checkColor: Colors.white,
                            onChanged: (bool val) {
                              sunday = val;

                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(18),
                        ),
                        RaisedButton(
                          onPressed: sunday
                              ? () {
                                  DateTimeRangePicker(
                                    startText: "From",
                                    endText: "To",
                                    doneText: "Yes",
                                    cancelText: "Cancel",
                                    interval: 1,
                                    initialStartTime: DateTime.now(),
                                    initialEndTime: DateTime.now().add(
                                      Duration(days: 20),
                                    ),
                                    mode: DateTimeRangePickerMode.time,
                                    onConfirm: (start, end) {
                                      _sunday =
                                          'FROM: ${start.hour}:${start.minute}   TO: ${end.hour}:${end.minute}';
                                      setState(() {});
                                    },
                                  ).showPicker(context);
                                }
                              : null,
                          child: Text('Time'),
                          color: mainColor,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: CheckboxListTile(
                            subtitle: Text(_monday),
                            activeColor: mainColor,
                            title: Text(
                              'Monday',
                              style: TextStyle(color: Colors.black),
                            ),
                            value: monday,
                            dense: true,
                            checkColor: Colors.white,
                            onChanged: (bool val) {
                              monday = val;

                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(18),
                        ),
                        RaisedButton(
                          onPressed: monday
                              ? () {
                                  DateTimeRangePicker(
                                    startText: "From",
                                    endText: "To",
                                    doneText: "Yes",
                                    cancelText: "Cancel",
                                    interval: 1,
                                    initialStartTime: DateTime.now(),
                                    initialEndTime: DateTime.now().add(
                                      Duration(days: 20),
                                    ),
                                    mode: DateTimeRangePickerMode.time,
                                    onConfirm: (start, end) {
                                      _monday =
                                          'FROM: ${start.hour}:${start.minute}   TO: ${end.hour}:${end.minute}';
                                      setState(() {});
                                    },
                                  ).showPicker(context);
                                }
                              : null,
                          child: Text('Time'),
                          color: mainColor,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: CheckboxListTile(
                            subtitle: Text(_tuesday),
                            activeColor: mainColor,
                            title: Text(
                              'Tuesday',
                              style: TextStyle(color: Colors.black),
                            ),
                            value: tuesday,
                            dense: true,
                            checkColor: Colors.white,
                            onChanged: (bool val) {
                              tuesday = val;

                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(18),
                        ),
                        RaisedButton(
                          onPressed: tuesday
                              ? () {
                                  DateTimeRangePicker(
                                    startText: "From",
                                    endText: "To",
                                    doneText: "Yes",
                                    cancelText: "Cancel",
                                    interval: 1,
                                    initialStartTime: DateTime.now(),
                                    initialEndTime: DateTime.now().add(
                                      Duration(days: 20),
                                    ),
                                    mode: DateTimeRangePickerMode.time,
                                    onConfirm: (start, end) {
                                      _tuesday =
                                          'FROM: ${start.hour}:${start.minute}   TO: ${end.hour}:${end.minute}';
                                      setState(() {});
                                    },
                                  ).showPicker(context);
                                }
                              : null,
                          child: Text('Time'),
                          color: mainColor,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: CheckboxListTile(
                            subtitle: Text(_wednesday),
                            activeColor: mainColor,
                            title: Text(
                              'Wednesday',
                              style: TextStyle(color: Colors.black),
                            ),
                            value: wednesday,
                            dense: true,
                            checkColor: Colors.white,
                            onChanged: (bool val) {
                              wednesday = val;

                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(18),
                        ),
                        RaisedButton(
                          onPressed: wednesday
                              ? () {
                                  DateTimeRangePicker(
                                    startText: "From",
                                    endText: "To",
                                    doneText: "Yes",
                                    cancelText: "Cancel",
                                    interval: 1,
                                    initialStartTime: DateTime.now(),
                                    initialEndTime: DateTime.now().add(
                                      Duration(days: 20),
                                    ),
                                    mode: DateTimeRangePickerMode.time,
                                    onConfirm: (start, end) {
                                      _wednesday =
                                          'FROM: ${start.hour}:${start.minute}   TO: ${end.hour}:${end.minute}';
                                      setState(() {});
                                    },
                                  ).showPicker(context);
                                }
                              : null,
                          child: Text('Time'),
                          color: mainColor,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: CheckboxListTile(
                            subtitle: Text(_thursday),
                            activeColor: mainColor,
                            title: Text(
                              'Thursday',
                              style: TextStyle(color: Colors.black),
                            ),
                            value: thursday,
                            dense: true,
                            checkColor: Colors.white,
                            onChanged: (bool val) {
                              thursday = val;

                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(18),
                        ),
                        RaisedButton(
                          onPressed: thursday
                              ? () {
                                  DateTimeRangePicker(
                                    startText: "From",
                                    endText: "To",
                                    doneText: "Yes",
                                    cancelText: "Cancel",
                                    interval: 1,
                                    initialStartTime: DateTime.now(),
                                    initialEndTime: DateTime.now().add(
                                      Duration(days: 20),
                                    ),
                                    mode: DateTimeRangePickerMode.time,
                                    onConfirm: (start, end) {
                                      _thursday =
                                          'FROM: ${start.hour}:${start.minute}   TO: ${end.hour}:${end.minute}';
                                      setState(() {});
                                    },
                                  ).showPicker(context);
                                }
                              : null,
                          child: Text('Time'),
                          color: mainColor,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: CheckboxListTile(
                            subtitle: Text(_friday),
                            activeColor: mainColor,
                            title: Text(
                              'Friday',
                              style: TextStyle(color: Colors.black),
                            ),
                            value: friday,
                            dense: true,
                            checkColor: Colors.white,
                            onChanged: (bool val) {
                              friday = val;
                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(18),
                        ),
                        RaisedButton(
                          onPressed: friday
                              ? () {
                                  DateTimeRangePicker(
                                    startText: "From",
                                    endText: "To",
                                    doneText: "Yes",
                                    use24hFormat: false,
                                    cancelText: "Cancel",
                                    interval: 1,
                                    initialStartTime: DateTime.now(),
                                    initialEndTime: DateTime.now().add(
                                      Duration(days: 20),
                                    ),
                                    mode: DateTimeRangePickerMode.time,
                                    onConfirm: (start, end) {
                                      _friday =
                                          'FROM: ${start.hour}:${start.minute} ${start.hour >= 12 ? 'PM' : 'AM'} TO: ${end.hour}:${end.minute} ${end.hour >= 12 ? 'PM' : 'AM'}';
                                      setState(() {});
                                    },
                                  ).showPicker(context);
                                }
                              : null,
                          child: Text('Time'),
                          color: mainColor,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(50),
                  ),
                  TheButton(
                    onTap: () async {
                      final userId = ModalRoute.of(context).settings.arguments;
                      try {
                        await FirebaseFirestore.instance.collection("users").doc(userId).update({
                          'work days' : {
                            'Saturday': {satarday.toString():_satarday},
                            'Sunday': {sunday.toString():_sunday},
                            'Monday': {monday.toString():_monday},
                            'Tuesday': {tuesday.toString():_tuesday},
                            'Wednesday': {wednesday.toString():_wednesday},
                            'Thursday': {thursday.toString():_thursday},
                            'Friday': {friday.toString():_friday},
                          }
                        });
                      } catch (e) {
                        print(e);
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => VerifyPhonePage(),
                        ),
                      );
                    },
                    title: 'NEXT',
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(30),
                  ),
                  RotatedBox(
                    quarterTurns: 2,
                    child: CustomPaint(
                      painter: CurvePainter(),
                      child: Container(
                        width: size.width,
                        height: size.height * .15,
                      ),
                    ),
                  ),
                ],
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
