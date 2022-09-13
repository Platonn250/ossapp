// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dateapp/constants/loading.dart';
import 'package:dateapp/pages/choose_a_t_page.dart';
import 'package:dateapp/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loginpage extends StatefulWidget {
  final VoidCallback showRegisterPage;

  Loginpage({
    Key? key,
    required this.showRegisterPage,
  }) : super(key: key);

  final id = 'loginScreen';

  @override
  State<Loginpage> createState() => _LoginpageState();
}

void loggin() {}

class _LoginpageState extends State<Loginpage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool loading = false;

  Future login() async {
    try {
      setState(() {
        loading = true;
      });
      await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text);

      setState(() {
        loading = false;
      });
      Navigator.pushNamed(context, HomeView().id);
      print(_auth.currentUser!.email);
    } catch (e) {
      print('e');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'lib/images/bar.jpg',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              toolbarHeight: 373.h,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Login",
                        style: GoogleFonts.roboto(
                            fontSize: 26.sp, fontWeight: FontWeight.w700),
                        // style: TextStyle(
                        //   fontSize: 48,
                        //   fontWeight: FontWeight.w700,
                        // ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(242, 237, 237, 1),
                      ),
                      height: 49.h,
                      width: 350.w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.h),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.mail),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(242, 237, 237, 1),
                      ),
                      height: 49.h,
                      width: 350.w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: TextField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: GestureDetector(
                      onTap: login,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(46, 80, 112, 1),
                        ),
                        height: 49.h,
                        width: 350.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // TextButton(
                  //   onPressed: () {},
                  //   child: Text("Or Login with"),
                  // ),
                  Text('Or login with'),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 52.h,
                        width: 85.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 215, 215, 215),
                              offset: Offset(4.0, 4.0),
                              blurRadius: 12,
                              spreadRadius: 1,
                            ),
                          ],
                          // color: Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset("lib/images/g.jpg"),
                      ),
                      Container(
                        height: 52.h,
                        width: 85.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 215, 215, 215),
                              offset: Offset(4.0, 4.0),
                              blurRadius: 12,
                              spreadRadius: 1,
                            ),
                          ],
                          // color: Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset("lib/images/f.jpg"),
                      ),
                      Container(
                        height: 52.h,
                        width: 85.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 215, 215, 215),
                              offset: Offset(4.0, 4.0),
                              blurRadius: 12,
                              spreadRadius: 1,
                            ),
                          ],
                          // color: Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset("lib/images/a.jpg"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Dont't have an acount? "),
                        GestureDetector(
                          onTap: widget.showRegisterPage,
                          child: Text(
                            " Register",
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          );
  }
}
