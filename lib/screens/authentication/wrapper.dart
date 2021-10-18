import 'package:codeathon/models/user.dart';
import 'package:codeathon/screens/authentication/login.dart';
import 'package:codeathon/screens/mainscreen/nav.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);

    if (user == null) {
      return LoginPage();
    } else {
      return NavPage();
    }
  }
}
