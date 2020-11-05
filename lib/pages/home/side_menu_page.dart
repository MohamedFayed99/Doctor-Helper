import 'package:doctor_helper/pages/add_case/add_case_page.dart';
import 'package:doctor_helper/pages/history/history_page.dart';
import 'package:doctor_helper/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

import '../../utils/consts.dart';
import '../auth/login.dart';

class CustomDrawer extends StatefulWidget {
  final Function closeDrawer;
  final userEmail;
  const CustomDrawer({Key key, this.closeDrawer,this.userEmail}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userEmail = ModalRoute.of(context).settings.arguments;
    return Container(
      height: size.height,
      width: size.width * .6,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/app_icon.png',
            height: size.height * .3,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AddCasePage(),
                ),
              );
              widget.closeDrawer();
            },
            leading: Icon(
              Icons.playlist_add,
              color: mainColor,
            ),
            title: Text('Add Case'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => HistoryPage(),
                ),
              );
              widget.closeDrawer();
            },
            title: Text('History'),
            leading: Icon(
              Icons.history,
              color: mainColor,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ProfilePage(),
                  settings: RouteSettings(
                    arguments: userEmail,
                  )
                ),
              );
              widget.closeDrawer();
            },
            leading: Icon(
              Icons.person_outline,
              color: mainColor,
            ),
            title: Text('Profile'),
          ),
          ListTile(
            onTap: () {
              widget.closeDrawer();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => LoginPage()),
                (_) => false,
              );
            },
            leading: Icon(
              Icons.launch,
              color: mainColor,
            ),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
