import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
    this.logo,
    this.jobName,
    this.company,
    this.location,
    this.salary,
    this.applications,
    this.experience,
    this.interviewing,
    this.invites,
    this.others,
    this.overview,
    this.tools,
    this.time,
    this.mode,
    this.money,
  );

  final String logo;
  final String jobName;
  final String company;
  final String location;
  final String salary;
  final String applications;
  final String experience;
  final String interviewing;
  final String invites;
  final String others;
  final String overview;
  final String tools;
  final String time;
  final String mode;
  final String money;

  final myTextStyle1 = TextStyle(
    color: Colors.grey[700],
    fontWeight: FontWeight.w600,
    fontSize: 15.0,
  );

  final myTextStyle2 = TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 3.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                onTap: () {
                  showCupertinoModalBottomSheet(
                    expand: false,
                    context: context,
                    barrierColor: Colors.black38,
                    builder: (context) => Material(
                      child: Container(
                        // constraints:
                        //    BoxConstraints(minHeight: 300.0, maxHeight: 550.0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DefaultTabController(
                              length: 3,
                              child: Column(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 16.0,
                                      ),
                                      Center(
                                        child: Container(
                                          width: 32.0,
                                          height: 8.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16.0,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      location.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey[700]),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      jobName,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 22.0),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(FontAwesomeIcons.mapMarkerAlt,
                                          size: 12.0, color: Colors.grey),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        'Anywhere',
                                        style: TextStyle(
                                            fontSize: 12.0, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Container(
                                            height: 100.0,
                                            width: 100.0,
                                            color: Color(0xFFF0DEE7),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.history,
                                                  color: Colors.red[800],
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(time),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Container(
                                            height: 100.0,
                                            width: 100.0,
                                            color: Color(0xFFF7F6E2),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.briefcase,
                                                  color: Colors.yellow[800],
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(mode),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Container(
                                            height: 100.0,
                                            width: 100.0,
                                            color: Color(0xFFE1EDE2),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.donate,
                                                  color: Colors.lightGreen,
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(money),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: TabBar(
                                            unselectedLabelColor:
                                                Colors.grey[700],
                                            labelColor: Colors.grey[700],
                                            indicator: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            tabs: [
                                              Tab(text: 'Description'),
                                              Tab(text: 'Skill Set'),
                                              Tab(text: 'Activity')
                                            ]),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Container(
                                        child: TabBarView(children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Overview',
                                                style: myTextStyle1,
                                              ),
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              Text(
                                                overview,
                                                style: myTextStyle2,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Tools:',
                                                style: myTextStyle1,
                                              ),
                                              Text(
                                                tools,
                                                style: myTextStyle2,
                                              ),
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              Text(
                                                'Experience Level:',
                                                style: myTextStyle1,
                                              ),
                                              Text(
                                                experience,
                                                style: myTextStyle2,
                                              ),
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              Text(
                                                'Others:',
                                                style: myTextStyle1,
                                              ),
                                              Text(
                                                others,
                                                style: myTextStyle2,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Applications:',
                                                style: myTextStyle1,
                                              ),
                                              Text(
                                                applications,
                                                style: myTextStyle2,
                                              ),
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              Text(
                                                'Interviewing:',
                                                style: myTextStyle1,
                                              ),
                                              Text(
                                                interviewing,
                                                style: myTextStyle2,
                                              ),
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              Text(
                                                'Invites Sent:',
                                                style: myTextStyle1,
                                              ),
                                              Text(
                                                invites,
                                                style: myTextStyle2,
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: SizedBox(
                                          height: 50.0,
                                          child: OutlinedButton(),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: 250.0,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushNamed('/tests');
                                            },
                                            child: Ink(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: [
                                                    Theme.of(context)
                                                        .primaryColor,
                                                    Theme.of(context)
                                                        .accentColor,
                                                  ],
                                                ),
                                              ),
                                              child: Container(
                                                alignment: Alignment.center,
                                                constraints: BoxConstraints(
                                                    maxWidth: double.infinity,
                                                    minHeight: 50.0),
                                                child: Text(
                                                  'Take assessment',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    fit: BoxFit.fill,
                    width: 40.0,
                    height: 40.0,
                    image: FirebaseImage(
                      logo,
                      shouldCache: true,
                    ),
                  ),
                ),
                title: Text(
                  jobName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.0),
                ),
                subtitle: Text(
                  company,
                  style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w500),
                ),
                trailing: Text(
                  salary,
                  style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
