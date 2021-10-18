import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Leaderboard',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  color: Colors.white,
                  width: double.maxFinite,
                  height: 5.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Image.asset(
                              'images/gold-medal.png',
                              height: 3.h,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Image.asset(
                              'icons/flags/png/my.png',
                              package: 'country_icons',
                              height: 2.h,
                            ),
                          ),
                          Text(
                            'Malaysia',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.5.sp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '50 P',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 10.sp),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 2.w),
                            child: Text(
                              '15,999',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.5.sp),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: double.maxFinite,
                  height: 5.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Image.asset(
                              'images/medal.png',
                              height: 3.h,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Image.asset(
                              'icons/flags/png/th.png',
                              package: 'country_icons',
                              height: 2.h,
                            ),
                          ),
                          Text(
                            'Thailand',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.5.sp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '50 P',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 10.sp),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 2.w),
                            child: Text(
                              '15,999',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.5.sp),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: double.maxFinite,
                  height: 5.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Image.asset(
                              'images/bronze-medal.png',
                              height: 3.h,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Image.asset(
                              'icons/flags/png/id.png',
                              package: 'country_icons',
                              height: 2.h,
                            ),
                          ),
                          Text(
                            'Indonesia',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12.5.sp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '50 P',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                                fontSize: 10.sp),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 2.w),
                            child: Text(
                              '15,999',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.5.sp),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 40.w,
                      child: Container(
                        height: 12.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white,
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          child: Center(
                            child: Text(
                              'Idea Proposal',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15.sp,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                      child: Container(
                        height: 12.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white,
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          child: Center(
                            child: Text(
                              'Contribution',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15.sp,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'Proposal',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Container(
                    height: 25.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white,
                      border: Border.all(color: Theme.of(context).primaryColor),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          child: Text(
                            'Eco-Bricks Challenge',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 15.sp,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.w),
                          child: Text(
                              'This challenge aims to bring awareness to the youth through social media platform such as Tiktok and Instagram'),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(
                              Icons.arrow_forward,
                              color: Theme.of(context).primaryColor,
                              size: 9.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
