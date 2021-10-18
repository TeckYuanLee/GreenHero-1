import 'package:codeathon/widgets/loading_spinner.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:codeathon/widgets/introtext.dart';
import 'package:codeathon/services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = AuthService();

  bool loading = false;
  String username = '';
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
                  image: AssetImage("images/bg2.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: GestureDetector(
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SafeArea(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                IntroText("Create your account,",
                                    "Sign up to get started!"),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 28.h),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      style: TextStyle(fontSize: 12.sp),
                                      validator: (String value) {
                                        if (value.isEmpty) {
                                          return "Enter a username";
                                        } else if (value.length > 12) {
                                          return "Enter a username not more than 12+ chars long";
                                        }
                                        return null;
                                      },
                                      onChanged: (val) {
                                        setState(() => username = val);
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 2.5.h),
                                        fillColor: Colors.white,
                                        filled: true,
                                        prefixIcon: Icon(
                                          Icons.account_circle,
                                          size: 20.sp,
                                        ),
                                        labelText: 'Username',
                                        labelStyle: TextStyle(fontSize: 12.sp),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color:
                                                Theme.of(context).accentColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        errorStyle: TextStyle(fontSize: 10.sp),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                        if (value.isEmpty) {
                                          return "Enter a valid email";
                                        }
                                        return null;
                                      },
                                      onChanged: (val) {
                                        setState(() => email = val);
                                      },
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 2.5.h),
                                        fillColor: Colors.white,
                                        filled: true,
                                        prefixIcon: Icon(
                                          Icons.email,
                                          size: 20.sp,
                                        ),
                                        labelText: 'Email',
                                        labelStyle: TextStyle(fontSize: 12.sp),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color:
                                                Theme.of(context).accentColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        errorStyle: TextStyle(fontSize: 10.sp),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 2.5.h),
                                        fillColor: Colors.white,
                                        filled: true,
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          size: 20.sp,
                                        ),
                                        labelText: 'Password',
                                        labelStyle: TextStyle(fontSize: 12.sp),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color:
                                                Theme.of(context).accentColor,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        errorStyle: TextStyle(fontSize: 10.sp),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    SizedBox(
                                      width: double.maxFinite,
                                      height: 7.5.h,
                                      child: OutlinedButton(
                                        onPressed: () async {
                                          if (_formKey.currentState
                                              .validate()) {
                                            setState(() {
                                              loading = true;
                                            });
                                            dynamic result =
                                                await _auth.register(
                                                    email, password, username);

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
                                                      'Could not sign up with those credentials');
                                              setState(() {
                                                loading = false;
                                              });
                                            }
                                          }
                                        },
                                        child: Text(
                                          'Sign Up',
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
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 5.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "Login now",
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
            ),
          );
  }
}
