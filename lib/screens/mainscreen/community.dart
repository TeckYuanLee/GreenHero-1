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
                  height: 2.h,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: EdgeInsets.all(1.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LeaderBoard('images/gold-medal.png',
                            'icons/flags/png/my.png', 'Malaysia'),
                        Divider(),
                        LeaderBoard('images/medal.png',
                            'icons/flags/png/th.png', 'Thailand'),
                        Divider(),
                        LeaderBoard('images/bronze-medal.png',
                            'icons/flags/png/id.png', 'Indonesia'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
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
                  height: 3.h,
                ),
                Text(
                  'Proposal',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white,
                      border: Border.all(color: Theme.of(context).primaryColor),
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
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(
                              Icons.arrow_forward,
                              color: Theme.of(context).primaryColor,
                              size: 8.w,
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

class LeaderBoard extends StatelessWidget {
  LeaderBoard(this.image, this.flag, this.country);

  final String image;
  final String flag;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      height: 6.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Image.asset(
                  image,
                  height: 4.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Image.asset(
                  flag,
                  package: 'country_icons',
                  height: 2.5.h,
                ),
              ),
              Text(
                country,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
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
                    fontSize: 12.sp),
              ),
              SizedBox(
                width: 2.w,
              ),
              Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: Text(
                  '15,999',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
