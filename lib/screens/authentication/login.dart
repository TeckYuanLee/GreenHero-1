import 'package:codeathon/widgets/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:codeathon/widgets/introtext.dart';
import 'package:sizer/sizer.dart';
import 'package:codeathon/services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = AuthService();

  bool loading = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bg4.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          IntroText("Welcome Back,", "Login to continue!"),
                          SizedBox(
                            height: 35.h,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  style: TextStyle(fontSize: 12.sp),
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "Enter your email address";
                                    }
                                    return null;
                                  },
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 2.5.h),
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Icon(
                                      Icons.email,
                                      size: 20.sp,
                                    ),
                                    labelText: 'Email',
                                    labelStyle: TextStyle(fontSize: 12.sp),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorStyle: TextStyle(fontSize: 10.sp),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                TextFormField(
                                  style: TextStyle(fontSize: 12.sp),
                                  validator: (String value) {
                                    if (value.length < 6) {
                                      return 'Enter a password 6+ chars long';
                                    }
                                    return null;
                                  },
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 2.5.h),
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      size: 20.sp,
                                    ),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(fontSize: 12.sp),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    errorStyle: TextStyle(fontSize: 10.sp),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    child: Text(
                                      "Forgot Password? ",
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                SizedBox(
                                  width: double.maxFinite,
                                  height: 7.5.h,
                                  child: OutlinedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() {
                                            loading = true;
                                          });
                                          dynamic result = await _auth
                                              .signInWithEmailAndPassword(
                                                  email, password);
                                          if (result != null) {
                                            setState(() {
                                              Navigator.of(context)
                                                  .pushNamed('/nav');
                                              loading = false;
                                            });
                                          }
                                          if (result == null) {
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Could not login with those credentials');
                                            setState(() {
                                              loading = false;
                                            });
                                          }
                                        }
                                      },
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        side: BorderSide(
                                          width: 1.0,
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Don't have an account yet?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/signup');
                                  },
                                  child: Text(
                                    "Sign up now",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor,
                                        fontSize: 12.sp),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
