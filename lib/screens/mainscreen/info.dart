import 'dart:async';
import 'dart:math' as math;

import 'package:codeathon/initiative.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:share_plus/share_plus.dart';

/// Private calss for storing the chart series data points.
class _ChartData {
  _ChartData(this.country, this.sales);
  final int country;
  final num sales;
}

class InfoPage extends StatefulWidget {
  // Data source which binds to the series
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  Timer timer;
  ChartSeriesController _chartSeriesController;
  int count = 19;

  //Initialize the data source
  List<_ChartData> chartData = <_ChartData>[
    _ChartData(0, 42),
    _ChartData(1, 47),
    _ChartData(2, 33),
    _ChartData(3, 49),
    _ChartData(4, 54),
    _ChartData(5, 41),
    _ChartData(6, 58),
    _ChartData(7, 51),
    _ChartData(8, 98),
    _ChartData(9, 41),
    _ChartData(10, 53),
    _ChartData(11, 72),
    _ChartData(12, 86),
    _ChartData(13, 52),
    _ChartData(14, 94),
    _ChartData(15, 92),
    _ChartData(16, 86),
    _ChartData(17, 72),
    _ChartData(18, 94),
  ];

  ///Continously updating the data source based on timer
  void _updateDataSource(Timer timer) {
    chartData.add(_ChartData(count, _getRandomInt(10, 100)));
    if (chartData.length == 20) {
      chartData.removeAt(0);
      _chartSeriesController?.updateDataSource(
        addedDataIndexes: <int>[chartData.length - 1],
        removedDataIndexes: <int>[0],
      );
      count = count + 1;
    }
  }

  ///Get the random data
  int _getRandomInt(int min, int max) {
    final math.Random _random = math.Random();
    return min + _random.nextInt(max - min);
  }

  /// Returns the realtime Cartesian line chart.
  SfCartesianChart _buildLiveLineChart() {
    return SfCartesianChart(
        //  backgroundColor: Colors.white,
        plotAreaBorderWidth: 0,
        primaryXAxis:
            NumericAxis(majorGridLines: const MajorGridLines(width: 0)),
        primaryYAxis: NumericAxis(
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(size: 0)),
        series: <LineSeries<_ChartData, int>>[
          LineSeries<_ChartData, int>(
            onRendererCreated: (ChartSeriesController controller) {
              _chartSeriesController = controller;
            },
            dataSource: chartData,
            color: Colors.green,
            xValueMapper: (_ChartData sales, _) => sales.country,
            yValueMapper: (_ChartData sales, _) => sales.sales,
            animationDuration: 0,
          )
        ]);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Here the _updateDataSource method is called for every second.
    timer =
        Timer.periodic(const Duration(milliseconds: 1000), _updateDataSource);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Our Community Members',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  height: 30.h,
                  width: double.maxFinite,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Next achievable milestone:',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 15.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '100,000 community members',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Image.asset(
                          'images/superhero.png',
                          height: 6.h,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 60.w,
                          height: 7.h,
                          child: OutlinedButton(
                            onPressed: () {
                              Share.share(
                                  'Start your Recycling Journey with GreenHero now!\n https://www.facebook.com/codeforasia/');
                            },
                            child: Text(
                              'Invite Your Friends Now',
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
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'Real-Time Recycling Rates\n in Malaysia 💚',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  height: 30.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                  ),
                  child: _buildLiveLineChart(),
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
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          child: Center(
                            child: Text(
                              'Recyclable',
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
                              'Non-Recyclable',
                              textAlign: TextAlign.center,
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
                  height: 5.h,
                ),
                Text(
                  'Current Initiatives',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebPage(
                          'https://www.recyclingwasteworld.co.uk/in-depth-article/a-new-era-for-plastics-recycling/217080/'),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Image(
                              fit: BoxFit.fill,
                              height: 200.0,
                              image: AssetImage('images/bottle1.png'),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'New Solution for New Era',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            subtitle: Text(
                                'Seraya Recycling Centre had proposed new initiatives to tackle plastic pollution in the COVID-19 pandemic'),
                            trailing: SizedBox(
                              width: 10.w,
                              child: Padding(
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebPage(
                          'https://www.plasticsoupfoundation.org/en/plastic-problem/plastic-soup/who-is-responsible/'),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Image(
                              fit: BoxFit.fill,
                              height: 200.0,
                              image: AssetImage('images/bottle2.png'),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Overused Plastic: Who to Blame?',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            subtitle: Text(
                                'The usage of plastic in daily life had increased drastically from 25% to 60% per year!'),
                            trailing: SizedBox(
                              width: 10.w,
                              child: Padding(
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
                            ),
                          ),
                        ],
                      ),
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
