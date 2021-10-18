import 'package:codeathon/models/user.dart';
import 'package:codeathon/screens/authentication/login.dart';
import 'package:codeathon/screens/authentication/signup.dart';
import 'package:codeathon/screens/mainscreen/nav.dart';
import 'package:codeathon/screens/map.dart';
import 'package:codeathon/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:codeathon/screens/log.dart';
import 'screens/authentication/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: AuthService().user,
      initialData: null,
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            // home: HomeController(),
            initialRoute: '/',
            routes: {
              '/': (context) => HomeController(),
              '/signup': (context) => SignUpPage(),
              '/login': (context) => LoginPage(),
              '/nav': (context) => NavPage(),
              '/map': (context) => MapPage(),
              '/log': (context) => LogPage(),
            },
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.green,
              primaryColor: Color(0xFF2D6950),
              accentColor: Color(0xFF5D8062),
              backgroundColor: Color(0xFFF3F5F5),
              scaffoldBackgroundColor: Color(0xFFF3F5F5),
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
          );
        },
      ),
    );
  }
}
