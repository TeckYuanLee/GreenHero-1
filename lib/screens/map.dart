import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:sizer/sizer.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:codeathon/widgets/roundbutton.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildSheet(context, state) => Material(
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
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cyberjaya Recycling \nCentre',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      FaIcon(
                        FontAwesomeIcons.bell,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  Text(
                      'Park & Ride, Persiaran Rimba Permai, Cyberjaya, 63000 Cyberjaya, Selangor'),
                  DateTimePicker(
                    type: DateTimePickerType.date,
                    controller: TextEditingController(),
                    dateMask: 'yyyy/MM/dd',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    icon: Icon(Icons.event),
                    dateLabelText: 'Date',
                  ),
                  DateTimePicker(
                    type: DateTimePickerType.time,
                    timePickerEntryModeInput: true,
                    controller: TextEditingController(text: '8:00'),
                    icon: Icon(Icons.access_time),
                    timeLabelText: "Time",
                    use24HourFormat: false,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 2.5.h, horizontal: 3.w),
                      hintText: 'Enter your recyclables',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FaIcon(
                          FontAwesomeIcons.recycle,
                          // size: 20.sp,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor, width: 2.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    controller: TextEditingController(),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundButton('Back', 40.w, 6.h),
                      SizedBox(
                        width: 40.w,
                        height: 6.h,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/nav');
                          },
                          child: Text(
                            'Confirm',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                            side: BorderSide(
                              width: 1.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
            ],
          ),
        );

    Future showSheet() => showSlidingBottomSheet(
          context,
          builder: (context) => SlidingSheetDialog(
            avoidStatusBar: true,
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            cornerRadius: 12.0,
            snapSpec: SnapSpec(
              initialSnap: 0.7,
              snappings: [0.4, 0.7, 1.0],
            ),
            builder: buildSheet,
          ),
        );

    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            center: LatLng(2.9273, 101.6507),
            zoom: 10.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            new MarkerLayerOptions(
              markers: [
                new Marker(
                  width: 50.0,
                  height: 50.0,
                  point: new LatLng(2.9273, 101.6507),
                  builder: (ctx) => GestureDetector(
                    onTap: () => showSheet(),
                    child: Image.asset('images/recycling-center.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16.0),
                    hintText: "Search for recycling centres",
                    prefixIcon: Icon(Icons.location_on_outlined),
                  ),
                ),
              ),
            ],
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        //Init Floating Action Bubble
        Padding(
          padding: EdgeInsets.all(5.w),
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: FloatingActionBubble(
              // Menu items
              items: <Bubble>[
                // Floating action menu item
                Bubble(
                  title: "Add Recycling Centres",
                  iconColor: Colors.white,
                  bubbleColor: Theme.of(context).primaryColor,
                  icon: FontAwesomeIcons.plusCircle,
                  titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                  onPress: () {
                    _animationController.reverse();
                  },
                ),
                // Floating action menu item
                Bubble(
                  title: "Rate Recycling Centres",
                  iconColor: Colors.white,
                  bubbleColor: Theme.of(context).primaryColor,
                  icon: FontAwesomeIcons.solidStar,
                  titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                  onPress: () {
                    _animationController.reverse();
                  },
                ),
                //Floating action menu item
                Bubble(
                  title: "     Respond to Q&As        ",
                  iconColor: Colors.white,
                  bubbleColor: Theme.of(context).primaryColor,
                  icon: FontAwesomeIcons.solidCommentAlt,
                  titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                  onPress: () {
                    _animationController.reverse();
                  },
                ),
              ],

              // animation controller
              animation: _animation,

              // On pressed change animation state
              onPress: () => _animationController.isCompleted
                  ? _animationController.reverse()
                  : _animationController.forward(),

              // Floating Action button Icon color
              iconColor: Colors.white,
              // Flaoting Action button Icon

              iconData: FontAwesomeIcons.handHoldingHeart,
              backGroundColor: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
