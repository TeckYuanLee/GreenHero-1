import 'package:flutter/material.dart';
import 'package:heatmap_calendar/heatmap_calendar.dart';
import 'package:heatmap_calendar/time_utils.dart';
import 'package:timelines/timelines.dart';
import 'package:sizer/sizer.dart';

class LogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recycling Log'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Calendar',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 3.h,
              ),
              HeatMapCalendar(
                input: {
                  TimeUtils.removeTime(
                      DateTime.now().subtract(Duration(days: 8))): 5,
                  TimeUtils.removeTime(
                      DateTime.now().subtract(Duration(days: 3))): 5,
                  TimeUtils.removeTime(
                      DateTime.now().subtract(Duration(days: 5))): 35,
                  TimeUtils.removeTime(
                      DateTime.now().subtract(Duration(days: 1))): 14,
                  TimeUtils.removeTime(DateTime.now()): 5,
                },
                colorThresholds: {
                  1: Colors.green[100],
                  10: Colors.green[300],
                  30: Colors.green[500]
                },
                weekDaysLabels: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
                monthsLabels: [
                  "",
                  "Jan",
                  "Feb",
                  "Mar",
                  "Apr",
                  "May",
                  "Jun",
                  "Jul",
                  "Aug",
                  "Sep",
                  "Oct",
                  "Nov",
                  "Dec",
                ],
                squareSize: 16.0,
                textOpacity: 0.5,
                labelTextColor: Theme.of(context).primaryColor,
                dayTextColor: Colors.green[500],
              ),
              Text(
                'History',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 3.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Timeline(
                      '250 pts',
                      'Seraya Recycling Centre\nRef: SRC112210071\n1/12/2021',
                      Colors.green[300]),
                  Timeline(
                      '520 pts',
                      'Cyberjaya Recycling Centre\nRef: SRC112210073\n12/10/2021',
                      Colors.green[500]),
                  Timeline(
                      '139 pts',
                      'Suria Recycling Centre\nRef: SRC113210051\n5/8/2021',
                      Colors.green[300]),
                  Timeline(
                      '107 pts',
                      'Indah Recycling Centre\nRef: SRC155216071\n28/7/2021',
                      Colors.green[100]),
                  Timeline(
                      '70 pts',
                      'Alam Recycling Centre\nRef: SRC182250071\n10/7/2021',
                      Colors.green[100]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Timeline extends StatelessWidget {
  Timeline(this.label, this.points, this.color);

  final String label;
  final String points;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      oppositeContents: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
      ),
      contents: Card(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Text(
            points,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
      node: TimelineNode(
        indicator: DotIndicator(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: color,
            ),
            width: 15.0,
            height: 15.0,
          ),
        ),
        startConnector: SolidLineConnector(
          color: Theme.of(context).primaryColor,
        ),
        endConnector: SolidLineConnector(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
