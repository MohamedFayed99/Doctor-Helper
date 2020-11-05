import 'package:doctor_helper/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class TheButton extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final String title;
  final Function onTap;
  final double buttonWidth;

  const TheButton({
    Key key,
    this.textColor,
    this.backgroundColor,
    @required this.title,
    this.onTap,
    this.buttonWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      width: buttonWidth ?? size.width * .75,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: FlatButton(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(40),
            vertical: ScreenUtil().setHeight(15),
          ),
          color: backgroundColor ?? mainColor,
          onPressed: onTap ?? () {},
          child: Text(
            title,
            style: TextStyle(
              color: textColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
