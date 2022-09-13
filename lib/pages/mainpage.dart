import 'package:dateapp/pages/loginpage.dart';
import 'package:dateapp/pages/registerpage.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool showLoginPage = true;
  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Loginpage(
        showRegisterPage: toggleScreens,
      );
    } else {
      return RegisterPage(
        showLoginPage: toggleScreens,
      );
    }
  }
}
