import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_helper/pages/auth/auth_determine_works_date_time.dart';
import 'package:doctor_helper/utils/app_utils.dart';
import 'package:doctor_helper/utils/consts.dart';
import 'package:doctor_helper/widgets/the_buttons.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:geolocator/geolocator.dart';

class AuthLocationPicker extends StatefulWidget {
  @override
  _AuthLocationPickerState createState() => _AuthLocationPickerState();
}

class _AuthLocationPickerState extends State<AuthLocationPicker> {
  final flipCardKey = GlobalKey<FlipCardState>();
  String latlong = '';
  String address = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      child: Stack(
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
            child: RotatedBox(
              quarterTurns: 2,
              child: Image.asset(
                'assets/images/main_top.png',
                width: size.width * .35,
              ),
            ),
          ),
          SingleChildScrollView(
            physics: scrollPhysics,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: size.height * .20,
                  ),
                  Text(
                    'Determine your location'
                        .toUpperCase()
                        .replaceAll(' ', '  '),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(25),
                  ),
                  FlipCard(
                    key: flipCardKey,
                    flipOnTouch: false,
                    front: FrontCard(
                      flipCardKey: flipCardKey,
                    ),
                    back: BackCard(
                      flipCardKey: flipCardKey,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(36),
                  ),
                  TheButton(
                    onTap: () async{
                      final userId = ModalRoute.of(context).settings.arguments;
                      // BackCard backCardObject;
                      try {
                        await FirebaseFirestore.instance.collection("users").doc(userId).update({
                            'address': {
                              'address' : 'Fayoummm',   // address from BackCard Class
                              'latitude and longitude' : 'latlong' // from FrontCard Class
                            } ,
                        });
                      } catch (e) {
                        print(e);
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DetermineWorksDateTime(),
                          settings: RouteSettings(
                            arguments: userId,
                          ),
                        ),
                      );
                    },
                    title: 'NEXT',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class FrontCard extends StatefulWidget {
  const FrontCard({
    Key key,
    @required this.flipCardKey,
  }) : super(key: key);

  final GlobalKey<FlipCardState> flipCardKey;

  @override
  _FrontCardState createState() => _FrontCardState();
}

class _FrontCardState extends State<FrontCard> {


  @override
  Widget build(BuildContext context) {
    String latlong = '';
    Future<String> getLatLongPosition() async {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latlong = '${position.latitude}, ${position.longitude}';
      return latlong;
    }
    return Card(
      color: secondColor,
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: Column(
          children: <Widget>[
            Text(
              'Pick your location using GPS for better accuracy',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Container(
              width: double.infinity,
              color: Colors.amber,
              child: FlatButton(
                onPressed: ()  {
                  getLatLongPosition();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    latlong == ''
                        ? SizedBox.shrink()
                        : Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                    Text(
                      'Pick using GPS',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.gps_fixed,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            latlong == ''
                ? SizedBox.shrink()
                : Container(
                    color: Colors.black12,
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Location:  $latlong'),
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            latlong = '';

                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Container(
              width: double.infinity,
              color: Colors.blue,
              child: FlatButton(
                onPressed: () {
                  widget.flipCardKey.currentState.toggleCard();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(),
                    Text(
                      'I want to type the address manually',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.white,
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
}

class BackCard extends StatefulWidget {
  const BackCard({
    Key key,
    @required this.flipCardKey,
  }) : super(key: key);

  final GlobalKey<FlipCardState> flipCardKey;

  @override
  _BackCardState createState() => _BackCardState();
}

class _BackCardState extends State<BackCard> {
  String address;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondColor,
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: (String input) {
                address = input;
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: mainColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: mainColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.red,
                  ),
                ),
                hintText: 'Enter your address',
                labelText: 'Address',
              ),
              validator: (value){
               if (value.isEmpty){
                 return 'please enter the address';
               }
                 return null;
               },
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            Container(
              width: double.infinity,
              color: Colors.amber,
              child: FlatButton(
                onPressed: () {
                  AppUtils.hidwKeyboared(context);
                  widget.flipCardKey.currentState.toggleCard();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(),
                    Text(
                      'Back to pick my location using GPS',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.gps_fixed,
                      color: Colors.white,
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
}
