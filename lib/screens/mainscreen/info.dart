import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '100,000',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30.sp,
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
                              'PEOPLE JOINED THE COMMUNITY',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Image.asset(
                          'images/superhero.png',
                          height: 6.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Real -Time Plastic 💚\nReduction Graph',
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
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
                Container(
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
                Container(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
