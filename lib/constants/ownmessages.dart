// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        Text("Hey"),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("2:00"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.done_all),
            ),
          ],
        )
      ]),
    );
  }
}
