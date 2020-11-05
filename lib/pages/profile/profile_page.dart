import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_helper/widgets/the_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';


import '../../utils/consts.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userEmail = ModalRoute.of(context).settings.arguments;

//    Future<List<String>> getWorkDays(int userIndex) async {
//      String saturday ='Not Work';
//      String sunday ='Not Work';
//      String monday ='Not Work';
//      String tuesday ='Not Work';
//      String wednesday ='Not Work';
//      String thursday ='Not Work';
//      String friday ='Not Work';
//      List<String> workDays=[];
//      var result;
//        await FirebaseFirestore.instance.collection('users')
//          .where('email',isEqualTo: userEmail)
//          .get().then((value) => {
//            value.docs.forEach((results) {
//              result = results.data();
//              if(result['work days']['Saturday'] == 'true'){
//                saturday = result['work days']['Saturday'];
//
//              }
//              if(result['work days']['Sunday'] == 'true'){
//                sunday = result['work days']['Sunday'];
//
//              }
//              if(result['work days']['Monday'] == 'true'){
//                monday = result['work days']['Monday'];
//
//              }
//              if(result['work days']['Tuesday'] == 'true'){
//                tuesday = result['work days']['Tuesday'];
//              }
//              if(result['work days']['Wednesday'] == 'true'){
//                wednesday = result['work days']['Wednesday'];
//
//              }
//              if(result['work days']['Thursday'] == 'true'){
//                thursday = result['work days']['Thursday'];
//
//              }
//              if(result['work days']['Friday'] == 'true'){
//                friday = result['work days']['Friday'];
//
//              }
//              workDays = [saturday,sunday,monday,tuesday,wednesday,thursday,friday];
//              print(workDays);
//            })
//      });
//
//      return workDays;
//    }

    return Scaffold(
      appBar: appBar(
        title: 'Profile',
        leadingIcon: Icons.arrow_back,
        context: context,
      ),
      body: SingleChildScrollView(
        physics: scrollPhysics,
        child: Container(
          height: size.height,
          width: size.width,
          child:  StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').where('email',isEqualTo: userEmail).snapshots(),
            builder: (context,snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              } else
                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context,index) {
                      DocumentSnapshot user = snapshot.data.docs[index];
                      return Column(
                        children: <Widget>[
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
                          FittedBox(
                            fit: BoxFit.contain,
                            child: Container(
                              decoration: new BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: mainColor,
                                ),
                                borderRadius: new BorderRadius.all(
                                  Radius.circular(100.0),
                                ),
                                shape: BoxShape.rectangle,
                              ),
                              child: CircleAvatar(
                                radius: 80,
                                backgroundImage: AssetImage(
                                  'assets/images/male.png',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(15),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.text_fields,
                            ),
                            title: Text('Name'),
                            subtitle: Text(
                              user['name'].toString(),
                              style: TextStyle(color: mainColor),
                            ),
                            trailing: Icon(Icons.arrow_right),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.merge_type,
                            ),
                            title: Text('Gender'),
                            subtitle: Text(
                              user['gender'].toString(),
                              style: TextStyle(color: mainColor),
                            ),
                            trailing: Icon(Icons.arrow_right),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.location_on,
                            ),
                            title: Text('Location'),
                            subtitle: Text(
                              user['address']['latitude and longitude'].toString(),
                              style: TextStyle(color: mainColor),
                            ),
                            trailing: Icon(Icons.arrow_right),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.calendar_today,
                            ),
                            title: Text('Works days'),
                            subtitle: Text(
                      'Sunday: ${user['work days']['Sunday']['true'].toString()} , '
                                  'Saturday: ${user['work days']['Saturday']['true'].toString()} , '
                                  'Monday: ${user['work days']['Monday']['true'].toString()} , '
                                  'Tuesday: ${user['work days']['Tuesday']['true'].toString()} ,'
                                  'Wednesday: ${user['work days']['Wednesday']['true'].toString()} , '
                                 'Thursday: ${user['work days']['Thursday']['true'].toString()} , '
                                  'Friday: ${user['work days']['Friday']['true'].toString()} ,',
                              style: TextStyle(color: mainColor),
                            ),
                            trailing: Icon(Icons.arrow_right),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.phone,
                            ),
                            title: Text('Phone'),
                            subtitle: Text(
                              user['phone'],
                              style: TextStyle(color: mainColor),
                            ),
                            trailing: Icon(Icons.arrow_right),
                            onTap: () {},
                          ),
                          ListTile(
                              leading: Icon(
                                Icons.lock,
                              ),
                              title: Text('Password'),
                              subtitle: Text(
                                'xxxxxxxxxxxxx',
                                style: TextStyle(color: mainColor),
                              ),
                              trailing: Icon(Icons.arrow_right),
                              onTap: () {},
                            ),

                        ],
                      );
                    }
                );
            },
          ),

          ),
        ),
      );

  }



}
