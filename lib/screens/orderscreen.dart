// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);
  final id = 'orderscreen';

  @override
  Widget build(BuildContext context) {
    final clothings = [
      'https://images.unsplash.com/photo-1610897600804-c36e2336ad3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8am9yZGFuJTIwNHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YmxhY2slMjB0JTIwc2hpcnR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1529810313688-44ea1c2d81d3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGRpb3IlMjBzaG9lc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    ];

    final names = [
      'Air Jordan',
      "BLack T-Shirt",
      'Dior',
    ];
    return SafeArea(
        child: Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.message,
              size: 42,
            ),
            Text(
              "Orders",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Container(
                    height: 56,
                    width: 397,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 215, 215, 215),
                          offset: Offset(4.0, 4.0),
                          blurRadius: 12,
                          spreadRadius: 1,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 20,
                //   ),
                //   child: Align(
                //     alignment: Alignment.bottomLeft,
                //     child: Text(
                //       'Messages',
                //       style: TextStyle(
                //         fontSize: 24,
                //         fontWeight: FontWeight.w700,
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return MyTile(
                          title: names[index],
                          imgUrl: clothings[index],
                        );
                        // return Padding(
                        //   padding: EdgeInsets.symmetric(
                        //       horizontal: 20, vertical: 8.0),
                        //   child: Container(
                        //     height: 56,
                        //     width: 353,
                        //     decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(12),
                        //         boxShadow: [
                        //           BoxShadow(
                        //             blurRadius: 10,
                        //             offset: Offset(0, 3),
                        //             color: Colors.grey.withOpacity(0.4),
                        //           )
                        //         ]),
                        //     child: Center(
                        //       child: ListTile(
                        //         trailing: Icon(Icons.navigate_next_outlined),
                        //         // leading: CircleAvatar(),
                        //         leading: ClipRRect(
                        //           borderRadius: BorderRadius.circular(50),
                        //           child: Container(
                        //             height: 38,
                        //             width: 38,
                        //             decoration: BoxDecoration(
                        //               color: Colors.blue,
                        //             ),
                        //             child: Image.network(
                        //               clothings[index],
                        //               fit: BoxFit.fill,
                        //             ),
                        //           ),
                        //         ),
                        //         title: Text(
                        //           names[index],
                        //           style: TextStyle(fontSize: 18),
                        //         ),
                        //         subtitle: Text("Today, Nov 17  6:17"),
                        //       ),
                        //     ),
                        //   ),
                        // );
                      }),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class MySubTitle extends StatelessWidget {
  const MySubTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Today, Aug 17 6:17",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class MyTile extends StatelessWidget {
  final imgUrl;
  final String title;
  const MyTile({Key? key, this.imgUrl, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ]),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Image.network(
                imgUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          title: Text(title),
          subtitle: MySubTitle(),
        ),
      ),
    );
  }
}
