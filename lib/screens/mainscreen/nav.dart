import 'package:codeathon/screens/mainscreen/home.dart';
import 'package:codeathon/screens/mainscreen/info.dart';
import 'package:codeathon/screens/mainscreen/profile.dart';
import 'package:codeathon/screens/mainscreen/scan.dart';
import 'package:codeathon/screens/mainscreen/community.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPages(),
      bottomNavigationBar: buildBar(),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 1:
        return CommunityPage();
      case 2:
        return InfoPage();
      case 3:
        return ProfilePage();
      default:
        return HomePage();
    }
  }

  Widget buildBar() {
    final inactiveColor = Colors.grey.shade800;

    return BottomNavyBar(
      itemCornerRadius: 15.0,
      selectedIndex: index,
      onItemSelected: (index) => setState(() => this.index = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          title: Text('Home'),
          textAlign: TextAlign.center,
          icon: Icon(Icons.home),
          activeColor: Color(0xFF2D6950),
          inactiveColor: inactiveColor,
        ),
        BottomNavyBarItem(
          title: Text('Community'),
          textAlign: TextAlign.center,
          icon: FaIcon(FontAwesomeIcons.users),
          activeColor: Color(0xFF2D6950),
          inactiveColor: inactiveColor,
        ),
        BottomNavyBarItem(
          title: Text('Info'),
          textAlign: TextAlign.center,
          icon: FaIcon(FontAwesomeIcons.lightbulb),
          activeColor: Color(0xFF2D6950),
          inactiveColor: inactiveColor,
        ),
        BottomNavyBarItem(
          title: Text('Profile'),
          textAlign: TextAlign.center,
          icon: FaIcon(FontAwesomeIcons.user),
          activeColor: Color(0xFF2D6950),
          inactiveColor: inactiveColor,
        ),
      ],
    );
  }
}
