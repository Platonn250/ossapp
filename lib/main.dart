// ignore_for_file: prefer_const_constructors

import 'pages/businesstyppage.dart';
import 'pages/categories.dart';
import 'pages/choose_a_t_page.dart';
import 'pages/home.dart';
import 'pages/homepage.dart';
import 'pages/loginpage.dart';
import 'pages/registerpage.dart';
import 'screens/chatscreen.dart';
import 'screens/orderscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(414, 896),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              ChatScreen().id: (context) => ChatScreen(),
              OrderScreen().id: (context) => OrderScreen(),
              Loginpage(showRegisterPage: () {}).id: (context) =>
                  Loginpage(showRegisterPage: () {}),
              RegisterPage(showLoginPage: () {}).id: (context) =>
                  RegisterPage(showLoginPage: () {}),
              AccountType().id: (context) => AccountType(),
              CategoriesPage().id: (context) => CategoriesPage(),
              BusinessType().id: (context) => BusinessType(),
              HomeView().id: (context) => HomeView(),

              // '/': (context) => HomePage(),
            },
            home: HomePage(),
          );
        });
  }
}
