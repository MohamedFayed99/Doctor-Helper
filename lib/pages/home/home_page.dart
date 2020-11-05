import 'package:doctor_helper/pages/home/patients_page.dart';
import 'package:doctor_helper/pages/home/side_menu_page.dart';
import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:swipe_gesture_recognizer/swipe_gesture_recognizer.dart';

import '../../utils/consts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FSBStatus drawerStatus;

  @override
  Widget build(BuildContext context) {
    final userEmail = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SwipeGestureRecognizer(
        onSwipeLeft: () {
          setState(() {
            drawerStatus = FSBStatus.FSB_CLOSE;
          });
        },
        onSwipeRight: () {
          setState(() {
            drawerStatus = FSBStatus.FSB_OPEN;
          });
        },
        child: FoldableSidebarBuilder(
          drawerBackgroundColor: mainColor,
          drawer: CustomDrawer(
            closeDrawer: () {
              setState(() {
                drawerStatus = FSBStatus.FSB_CLOSE;
              });
            },
            userEmail: userEmail,
          ),
          screenContents: PatientsScreen(
            openDrawer: () {
              setState(() {
                drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                    ? FSBStatus.FSB_CLOSE
                    : FSBStatus.FSB_OPEN;
              });
            },
          ), // Your Screen Widget
          status: drawerStatus,
        ),
      ),
    );
  }
}
