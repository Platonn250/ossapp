// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dateapp/pages/categories.dart';
import 'package:dateapp/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountType extends StatefulWidget {
  final id = 'accounttype';

  AccountType({Key? key}) : super(key: key);

  @override
  State<AccountType> createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  bool isSelected = false;
  final _database = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  final images = [
    'lib/images/bus.jpg',
    'lib/images/user.jpg',
  ];

  final types = [
    'Business',
    'user',
  ];
  String accountType = '';
  String user = '';

  int select = 0;

  @override
  Widget build(BuildContext context) {
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
        toolbarHeight: 200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Choose Account type",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        select = index;
                        accountType = types[index];
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: 169.h,
                        height: 105.w,
                        decoration: BoxDecoration(
                          color: select == index
                              ? Color.fromRGBO(46, 80, 112, 1)
                              : Colors.white,
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
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(images[index]),
                              Text(types[index])
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Choosing business this means that you will be able to do business in your current location by selling or providing services and make money.",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return AccountType();
                        }));
                      }),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) {
                          //   return HomeView();
                          // }));
                          _database
                              .collection('accounts')
                              .doc(_auth.currentUser!.email.toString())
                              .set({
                            'Type': accountType,
                          });

                          Navigator.pushNamed(context, CategoriesPage().id);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(46, 80, 112, 1),
                          ),
                          height: 49,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Center(
                              child: Text(
                                "Continue",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
