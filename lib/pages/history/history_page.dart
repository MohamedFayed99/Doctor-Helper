import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_helper/pages/home/patient_profile_page.dart';
import 'package:doctor_helper/widgets/the_app_bar.dart';
import 'package:flutter/material.dart';

import '../../utils/consts.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
//    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: appBar(
        title: 'History',
        leadingIcon: Icons.arrow_back,
        context: context,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('patients').snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          } else {
            return ListView.separated(
                physics: scrollPhysics,
                separatorBuilder: (context, index) {
                  return Divider(
                    color: mainColor,
                    indent: 10,
                    height: 40,
                    endIndent: 10,
                    thickness: 1.5,
                  );
                },
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context,index){
                  DocumentSnapshot patient = snapshot.data.docs[index];
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => PatientProfilePage(),
                          settings: RouteSettings(
                            arguments: index,
                          )
                        ),
                      );
                    },
                    title: Text('${patient['first name'].toString()} ${patient['second name'].toString()}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(patient['gender'].toString()),
                        Text('Sunday 7/6/2020'),
                      ],
                    ),
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
                      Icons.visibility,
                      color: mainColor,
                    ),
                  );
                }
            );
          }
      },
      )


    );
  }
}
