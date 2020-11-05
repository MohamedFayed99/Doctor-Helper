import 'package:doctor_helper/widgets/the_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../../utils/consts.dart';
import '../../widgets/TheTextFormFeild.dart';
import '../../widgets/the_buttons.dart';

class AddCasePage extends StatefulWidget {
  @override
  _AddCasePageState createState() => _AddCasePageState();
}

class _AddCasePageState extends State<AddCasePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
        title: 'Add Case',
        leadingIcon: Icons.arrow_back,
        context: context,
      ),
      body: SingleChildScrollView(
        physics: scrollPhysics,
        child: Container(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                Text('The indication'),
                TheTextFormField(
                  borderRaduis: 8,
                  maxLine: 15,
                  keyboardType: TextInputType.multiline,
                  width: size.width,
                  hint: 'Type the indication',
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                Text('The treatment'),
                Expanded(
                  child: TheTextFormField(
                    borderRaduis: 8,
                    maxLine: 10,
                    keyboardType: TextInputType.multiline,
                    width: size.width,
                    hint: 'Type the treatment',
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(20),
                ),
                Center(
                  child: TheButton(title: 'Upload'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
