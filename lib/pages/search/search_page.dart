import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/consts.dart';

class SearchPage extends SearchDelegate<String> {
  SearchPage()
      : super(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          searchFieldLabel: 'type patient\'s code...',
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: mainColor,
      primaryIconTheme: theme.primaryIconTheme,
      primaryColorBrightness: theme.primaryColorBrightness,
      hintColor: Colors.white,
      indicatorColor: Colors.white,
      backgroundColor: Colors.white,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
        ),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  void showSuggestions(BuildContext context) {}

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(
          context,
          null,
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: ScreenUtil().setHeight(80),
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.visibility,
                  color: mainColor,
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(20),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Patient name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('170 cm'),
                    Text('70 kg'),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Patient type'),
                Text('36 years'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == null || query.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(
            ScreenUtil().setHeight(8.0),
          ),
          child: Text(
            'Search for patient',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      );
    }

    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: ScreenUtil().setHeight(80),
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.visibility,
                  color: mainColor,
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(20),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Patient name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('170 cm'),
                    Text('70 kg'),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Patient type'),
                Text('36 years'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
