// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dateapp/constants/constwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final images = [
      "https://images.unsplash.com/photo-1588733103629-b77afe0425ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGNpdGllc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1612698093158-e07ac200d44e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGNpdGllc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1525095240410-9645dea911e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2l0aWVzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ];

    final foodImages = [
      'https://images.unsplash.com/photo-1565192259022-0427b058f372?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZpc2glMjBhbmQlMjBjaGlwc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YnVyZ2VyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1622240506921-042a4e71c172?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGNvZmZlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    ];

    final foodShops = [
      'Fish and Chips',
      'Burger Shops',
      'Coffee Shops',
    ];

    final places = [
      'Hotels',
      'Shops',
      'Bars',
    ];
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Container(
              height: 72,
              // color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://media.istockphoto.com/photos/happy-millennial-afro-american-business-woman-posing-isolated-on-picture-id1386479313?b=1&k=20&m=1386479313&s=170667a&w=0&h=axEYGqmMKgDx8nk47CRAuGc27P1mnEu3zDJCdK7WlsE="),
                    // child: Image.asset("lib/images/man.jpg"),
                  ),
                  Row(
                    children: [
                      Icon(Icons.place),
                      Text(
                        "NY City, st 398",
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.6),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  Image.asset("lib/images/icon.png")
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Container(
              height: 58.h,
              decoration: BoxDecoration(
                color: Color.fromRGBO(229, 229, 229, 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        fontSize: 20.sp,
                        color: Color.fromRGBO(0, 0, 0, 0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Popular Categories",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 6.w),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    height: 61,
                    width: 158,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              // borderRadius: BorderRadius.circular(12),
                            ),
                            height: 43,
                            width: 41,
                            // child: Image.asset("lib/images/house.jpg"),
                            child: Image.network(
                              images[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          places[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Expanded(
          //   child: Container(
          //     color: Colors.brown,
          //   ),
          // ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            "Top Shops",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Image.asset("lib/images/down.png"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            "Explore",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(0, 0, 0, 0.6),
                            ),
                          ),
                          Image.asset("lib/images/next.png"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  // child: GridView.count(
                  //   crossAxisCount: 2,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Container(
                  //         // height: 200,
                  //         // width: 200,
                  //         color: Colors.deepPurple,
                  //         child: Column(
                  //           children: [
                  //             ClipRRect(
                  //               borderRadius: BorderRadius.circular(12),
                  //               child: Container(
                  //                 height: 120,
                  //                 width: 110,
                  //                 child: Image.network(
                  //                   foodImages[0],
                  //                   fit: BoxFit.fill,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 217,
                            width: 161,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      height: 150,
                                      width: 160,
                                      child: Image.network(
                                        foodImages[index],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            foodShops[index],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            "kg 329",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.6),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xffe8e8e8),
                                              blurRadius: 5.0,
                                              offset: Offset(0, 5),
                                            ),
                                            BoxShadow(
                                              color: Colors.white,
                                              // blurRadius: 5.0,
                                              offset: Offset(-10, 0),
                                            ),
                                            BoxShadow(
                                              color: Colors.white,
                                              offset: Offset(10, 0),
                                            )
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.red,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
