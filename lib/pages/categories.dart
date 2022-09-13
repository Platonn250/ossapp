// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dateapp/pages/businesstyppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool isSlected = false;

class CategoriesPage extends StatefulWidget {
  CategoriesPage({Key? key}) : super(key: key);
  final id = 'categoriespage';

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final _database = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String user = '';
  String category = '';
  int select = 0;
  @override
  Widget build(BuildContext context) {
    final titles = [
      'Shop',
      'Mall',
      'Gas Station',
      'Motel',
      'Hosts',
      'Other',
    ];

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/bar.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        toolbarHeight: 200.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),

          // ListTile(
          //   leading: CircleAvatar(
          //     backgroundColor: Color.fromRGBO(46, 80, 112, 1),
          //     radius: 10,
          //   ),
          //   title: Text(
          //     titles[0],
          //     style: TextStyle(
          //       fontSize: 24,
          //       color: Color.fromRGBO(46, 80, 112, 1),
          //       fontWeight: FontWeight.w700,
          //     ),
          //   ),
          //   trailing: Icon(Icons.verified),
          // ),
          Expanded(
            flex: 5,
            child: Container(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Container(
                          decoration: BoxDecoration(
                            color: select == index
                                ? Color.fromRGBO(8, 43, 55, 1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                select = index;
                                category = titles[index];
                              });
                              try {
                                _database
                                    .collection('users')
                                    .doc(_auth.currentUser!.email.toString())
                                    .collection('Account')
                                    .doc('myAccount')
                                    .set({
                                  'Category': category,
                                });
                              } catch (e) {
                                print(e.toString());
                              }
                              // print(accountType);
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: select == index
                                    ? Colors.white
                                    : Color.fromRGBO(46, 80, 112, 1),
                                radius: 10,
                              ),
                              title: Text(
                                titles[index],
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  color: select == index
                                      ? Colors.white
                                      : Color.fromRGBO(46, 80, 112, 1),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              trailing: select == index
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return HomeView();
                // }));
                Navigator.pushNamed(context, BusinessType().id);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(46, 80, 112, 1),
                  ),
                  height: 49.h,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: Text(
                        "Continue",
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
        ],
      ),
    );
  }
}
