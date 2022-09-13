// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dateapp/constants/constwidgets.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final images = [
      'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1531746020798-e6953c6e8e04?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      'https://media.istockphoto.com/photos/happy-millennial-afro-american-business-woman-posing-isolated-on-picture-id1386479313?b=1&k=20&m=1386479313&s=170667a&w=0&h=axEYGqmMKgDx8nk47CRAuGc27P1mnEu3zDJCdK7WlsE=',
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'https://media.istockphoto.com/photos/shot-of-a-handsome-young-man-standing-against-a-grey-background-picture-id1335941248?b=1&k=20&m=1335941248&s=170667a&w=0&h=sn_An6VRQBtK3BuHnG1w9UmhTzwTqM3xLnKcqLW-mzw=',
    ];

    final titles = [
      'Elleta Lopez',
      'Josie jackson',
      'Nathan Martin',
      'JacKson Martin',
      'Lopez Jossie',
    ];
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.notifications,
                size: 42,
              ),
              Text(
                "Notifications",
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
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return MyTile(
                        imgUrl: images[index],
                        title: titles[index],
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
