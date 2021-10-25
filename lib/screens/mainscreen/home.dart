import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:codeathon/models/user.dart';
import 'package:codeathon/services/database.dart';
import 'package:codeathon/widgets/loading_spinner.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //get user data
    final user = Provider.of<FirebaseUser>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return SafeArea(
              child: Scaffold(
                // backgroundColor: Colors.green[100],
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi ${userData.username} 🤘🏻',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp,
                                    color: Theme.of(context).primaryColor),
                              ),
                              Text(
                                'Nice to see you again!',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 25.h,
                              autoPlay: false,
                              enlargeCenterPage: true,
                              viewportFraction: 1,
                              aspectRatio: 2.0,
                              initialPage: 0,
                            ),
                            items: [1, 2, 3, 4, 5].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: 25.h,
                                    width: double.maxFinite,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        color: Color(0xFFD9EEDB),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.5.h,
                                                horizontal: 5.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    'Milestone',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 15.sp,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'LVL $i',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Image.asset(
                                            'images/trophy$i.png',
                                            height: 15.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          FAProgressBar(
                            currentValue: 42,
                            size: 40,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            progressColor: Color(0xFF80AC83),
                            backgroundColor: Color(0xFFFBFEF2),
                            displayText: ' points',
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            children: [
                              Container(
                                width: 40.w,
                                height: 42.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Color(0xFFA4C6B8),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5.w),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Reminder',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 15.sp,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            '13:00\n10 Dec\nWednesday\n\nCyberjaya Recycling Centre',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 15.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 2.h,
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () =>
                                        Navigator.of(context).pushNamed('/map'),
                                    child: SizedBox(
                                      child: Container(
                                        width: 40.w,
                                        height: 20.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 1.5.h),
                                              child: Text(
                                                'Recycle',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 15.sp,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            ),
                                            Image.asset(
                                              'images/recycle.png',
                                              height: 8.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SizedBox(
                                    child: Container(
                                      width: 40.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        color: Colors.white,
                                        border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.5.h),
                                            child: Text(
                                              'Help',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 15.sp,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ),
                                          Image.asset(
                                            'images/info.png',
                                            height: 8.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 1.5.h),
                        ]),
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
