// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dateapp/pages/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final _userEmail = FirebaseAuth.instance.currentUser!.email;

  final _auth = FirebaseAuth.instance;
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    void logOut() async {
      try {
        await _auth.signOut();
        Navigator.pushNamed(context, Loginpage(showRegisterPage: () {}).id);
      } catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 250.h,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.deepPurple,
            radius: 12,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1522529599102-193c0d76b5b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cG9ydHJhaXQlMjBhZnJpY2F8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
          ),
        ),
        title: Text(
          "Account",
          style: GoogleFonts.roboto(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.deepPurple,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.h),
            child: Icon(
              Icons.settings,
              color: Colors.deepPurple,
              size: 24.h,
            ),
          ),
        ],
        // bottom: TabBar(controller: _controller, tabs: [
        //   Tab(
        //     text: 'Home',
        //   ),
        //   Tab(
        //     text: 'Home',
        //   ),
        //   Tab(
        //     text: 'Home',
        //   )
        // ]),
      ),
      body: Column(
        children: [
          Container(
            height: 88,
            width: 88,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
