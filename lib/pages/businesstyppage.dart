// ignore_for_file: prefer_const_constructors

import 'package:dateapp/pages/home.dart';
import 'package:dateapp/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BusinessType extends StatefulWidget {
  const BusinessType({Key? key}) : super(key: key);
  final id = 'business';

  @override
  State<BusinessType> createState() => _BusinessTypeState();
}

class _BusinessTypeState extends State<BusinessType> {
  int select = 0;
  @override
  Widget build(BuildContext context) {
    final titles = [
      'Goods',
      'Services',
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
                "Business Type",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
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
            flex: 1,
            child: Container(
              child: ListView.builder(
                itemCount: titles.length,
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
                              });
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
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Text(
                      'Choosing business this means that you will be able to do business in your current location by selling or providing services and make money.',
                      style: GoogleFonts.roboto(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return HomeView();
                        // }));
                        Navigator.pushNamed(context, HomeView().id);
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
              ))
        ],
      ),
    );
  }
}
