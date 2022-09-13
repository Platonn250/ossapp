// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class IconButtonBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final VoidCallback onPressed;
  const IconButtonBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor:
              selected ? Color.fromRGBO(56, 80, 112, 1) : Colors.transparent,
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: 25,
              color: Colors.grey,
            ),
            // color: selected ? Colors.white : Colors.deepPurple,
          ),
        ),
        // Text(
        //   text,
        //   style: TextStyle(
        //     fontSize: 12,
        //     height: .1,
        //     color: selected ? Colors.deepPurple : Colors.red,
        //   ),
        // )
      ],
    );
  }
}

class MyGrid extends StatelessWidget {
  const MyGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 217,
            width: 161,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

class MySubTitle extends StatelessWidget {
  const MySubTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.alarm,
          size: 12,
        ),
        Text(
          "Wed, Aug 17 6:17",
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
    return ListTile(
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
    );
  }
}




// child: GridView.count(
                  //   crossAxisCount: 2,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Container(
                  //         height: 217,
                  //         width: 161,
                  //         color: Colors.blue,
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Container(
                  //         height: 217,
                  //         width: 161,
                  //         color: Colors.blue,
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Container(
                  //         height: 217,
                  //         width: 161,
                  //         color: Colors.blue,
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Container(
                  //         height: 217,
                  //         width: 161,
                  //         color: Colors.blue,
                  //       ),
                  //     ),
                  //   ],
                  // ),