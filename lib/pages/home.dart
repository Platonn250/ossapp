// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dateapp/constants/constwidgets.dart';
import 'package:dateapp/screens/chatscreen.dart';
import 'package:dateapp/screens/homescreen.dart';
import 'package:dateapp/screens/notificationscreeen.dart';
import 'package:dateapp/screens/orderscreen.dart';
import 'package:dateapp/screens/profilescreen.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  final id = 'home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  final screens = [
    HomeScreen(),
    NotificationsScreen(),
    ChatScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 237, 237, 1),
      bottomNavigationBar: Container(
        child: BottomAppBar(
          child: Container(
            color: Color.fromRGBO(242, 237, 237, 1),
            // color: Colors.deepPurple,
            child: SizedBox(
              height: 121,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButtonBar(
                          text: "",
                          icon: Icons.home,
                          selected: selectedIndex == 0,
                          onPressed: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                        ),
                        IconButtonBar(
                          icon: Icons.notifications,
                          onPressed: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                          selected: selectedIndex == 1,
                          text: 'Home',
                        ),
                        IconButtonBar(
                          icon: Icons.message,
                          onPressed: () {
                            setState(() {
                              selectedIndex = 2;
                            });
                          },
                          selected: selectedIndex == 2,
                          text: 'Home',
                        ),
                        IconButtonBar(
                          icon: Icons.calendar_month,
                          onPressed: () {
                            setState(() {
                              selectedIndex = 3;
                            });
                          },
                          selected: selectedIndex == 3,
                          text: 'Home',
                        ),
                        IconButtonBar(
                          icon: Icons.person,
                          onPressed: () {
                            setState(() {
                              selectedIndex = 4;
                            });
                          },
                          selected: selectedIndex == 4,
                          text: 'Home',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: screens[selectedIndex],
    );
  }
}
