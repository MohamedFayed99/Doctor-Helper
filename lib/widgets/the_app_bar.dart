import 'package:flutter/material.dart';

import '../utils/consts.dart';

Widget appBar({
  @required BuildContext context,
  @required String title,
  @required IconData leadingIcon,
  Function onLeadingIconPressed,
  Color leadingIconColor,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: mainColor,
    title: Text(title),
    actions: actions,
    leading: IconButton(
      icon: IconButton(
        icon: Icon(
          leadingIcon,
          color: leadingIconColor ?? Colors.white,
        ),
        onPressed: onLeadingIconPressed ??
            () {
              Navigator.of(context).pop();
            },
      ),
      onPressed: onLeadingIconPressed,
    ),
  );
}
