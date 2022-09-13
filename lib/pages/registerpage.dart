// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dateapp/constants/loading.dart';
import 'package:dateapp/pages/choose_a_t_page.dart';
import 'package:dateapp/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    Key? key,
    required this.showLoginPage,
  }) : super(key: key);

  final id = 'registerpage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _comfirmPassController = TextEditingController();
  final _nameController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _database = FirebaseFirestore.instance;
  bool loading = false;

  Future signUp() async {
    setState(() {
      loading = true;
    });
    try {
      await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      addToDb();
      setState(() {
        loading = false;
      });
      Navigator.pushNamed(context, AccountType().id);
      // Navigator.pushNamed(context, HomeView().id);
    } catch (e) {
      print(e.toString());
    }
  }

  Future addToDb() async {
    try {
      if (_passwordController.text == _comfirmPassController.text) {
        await _database
            .collection("users")
            .doc(_emailController.text.trim())
            .set({
          'name': _nameController.text.trim(),
          'email': _emailController.text.trim(),
        });
      } else if (_nameController.text.trim().length < 5) {
        print("Username mut be 5 chars long");
      } else {
        print("Passwords do not match!");
      }
      // await _database.collection('users').doc().add(
      //   {
      //     'name': _nameController.text.trim(),
      //     'email': _emailController.text.trim(),
      //   },
      // );

      // print("Aded ${{_auth.currentUser!.email}} successfully");
    } catch (e) {
      print(e.toString());
    }
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
                    image: AssetImage('lib/images/bar.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              toolbarHeight: 261.h,
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
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
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
                        width: 82.w,
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
                        width: 82.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // ignore: prefer_const_literals_to_create_immutables
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
                  Text(
                    "Or, with email",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 20.h,
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
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(fontSize: 14.sp),
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
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(fontSize: 14.sp),
                            prefixIcon: Icon(Icons.person),
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
                            hintStyle: TextStyle(fontSize: 14.sp),
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
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(242, 237, 237, 1),
                      ),
                      height: 49.h,
                      width: 350.w,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          obscureText: true,
                          controller: _comfirmPassController,
                          decoration: InputDecoration(
                            hintText: "Comfirm Pasword",
                            hintStyle: TextStyle(fontSize: 14.sp),
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
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: (() {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return HomeView();
                        // }));
                      }),
                      child: GestureDetector(
                        onTap: signUp,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(46, 80, 112, 1),
                          ),
                          height: 49.h,
                          width: 350.w,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.h),
                            child: Center(
                              child: Text(
                                "Sign up",
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an Acount? ",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        GestureDetector(
                          onTap: widget.showLoginPage,
                          child: Text(
                            " Login",
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ),
          );
  }
}
