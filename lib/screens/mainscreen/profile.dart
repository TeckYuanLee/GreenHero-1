import 'package:codeathon/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:codeathon/models/user.dart';
import 'package:codeathon/services/database.dart';
import 'package:codeathon/widgets/loading_spinner.dart';
import 'package:codeathon/widgets/roundbutton.dart';

class ProfilePage extends StatelessWidget {
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    //get user data
    final user = Provider.of<FirebaseUser>(context);
    final myTextStyle1 = TextStyle(
      fontSize: 13.sp,
      color: Theme.of(context).primaryColor,
    );
    final myTextStyle2 = TextStyle(
      fontSize: 13.sp,
      color: Theme.of(context).accentColor,
    );

    return StreamBuilder<UserData>(
        stream: DatabaseService(user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return SafeArea(
              child: Center(
                child: Scaffold(
                  body: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 70.0,
                            backgroundImage: NetworkImage(
                                'https://i1.wp.com/nyunews.com/wp-content/uploads/2021/03/IMG_9199.png?fit=900%2C900&ssl=1'),
                            backgroundColor: Colors.transparent,
                          ),
                          Text(
                            '${userData.username}',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Trophies',
                                    style: myTextStyle1.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '2',
                                    style: myTextStyle2,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Milestones',
                                    style: myTextStyle1.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '2',
                                    style: myTextStyle2,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Points',
                                    style: myTextStyle1.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '200',
                                    style: myTextStyle2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/log');
                              },
                              child: Text(
                                'Recycling Log',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor),
                              ),
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                backgroundColor: Colors.white,
                                side: BorderSide(
                                  width: 1.0,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          RoundButton('Bookmark', double.maxFinite, 50),
                          SizedBox(
                            height: 2.h,
                          ),
                          RoundButton('FAQ', double.maxFinite, 50),
                          SizedBox(
                            height: 2.h,
                          ),
                          RoundButton('Feedback', double.maxFinite, 50),
                          SizedBox(
                            height: 8.h,
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            height: 7.5.h,
                            child: OutlinedButton(
                                onPressed: () async {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/login', (route) => false);
                                  await _auth.signOut();
                                },
                                child: Text(
                                  'Sign Out',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  side: BorderSide(
                                    width: 1.0,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
