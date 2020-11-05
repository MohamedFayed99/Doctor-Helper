import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_helper/pages/home/patient_profile_page.dart';
import 'package:doctor_helper/pages/search/search_page.dart';
import 'package:doctor_helper/widgets/the_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../../utils/consts.dart';

class PatientsScreen extends StatefulWidget {
  final Function openDrawer;

  const PatientsScreen({Key key, this.openDrawer}) : super(key: key);

  @override
  _PatientsScreenState createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'Patients',
        leadingIcon: Icons.sort,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchPage(),
              );
            },
          ),
        ],
        onLeadingIconPressed: widget.openDrawer,
      ),
      body:  SingleChildScrollView(
        physics: scrollPhysics,
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Container(
                decoration: BoxDecoration(
                  color: mainColor.withOpacity(.6),
                  borderRadius: BorderRadius.circular(8),
                ),
                width: size.width * .4,
                height: ScreenUtil().setHeight(50),
                child: Center(
                  child: Text(
                    'Sunday  7/6/2020',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('patients').snapshots(),
                      builder: (context,snapshot){
                        if(!snapshot.hasData){
                          return Center(child: CircularProgressIndicator(),);
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context,index) {
                                  DocumentSnapshot patient = snapshot.data.docs[index];
                                  return Container(
                                    color: index % 2 == 0 ? Colors.black12 : null,
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => PatientProfilePage(),
                                            settings: RouteSettings(
                                              arguments: index
                                            )
                                          ),
                                        );
                                      },
                                      title: Text('${patient['first name'].toString()} ${patient['second name'].toString()}'),
                                      subtitle: Text(patient['gender'].toString()),
                                      trailing: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Expanded(child: Text('${patient['height'].toString()} cm')),
                                          Expanded(child: Text('${patient['weight'].toString()} kg')),
                                          Expanded(child: Text('${patient['age'].toString()}')),
                                        ],
                                      ),
                                      leading: Icon(
                                        index % 2 == 0
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: index % 2 == 0 ? mainColor : null,
                                      ),
                                    ),
                                  );
                              }
                          );
                        }
                      },

                    ),
              ),
              SizedBox(height: 10,)

            ],
          ),
        ),
      ),

    );
  }
}
