// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dateapp/constants/ownmessages.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1601412436009-d964bd02edbc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGZhY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
          ),
          title: Text(
            "Elleta Lopez",
            style: TextStyle(color: Colors.black),
          ),
          subtitle: Text("Online"),
        ),
        leading: GestureDetector(
          child: Image.asset('lib/images/back.png'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: ListView(
              children: [
                OwnMessageCard(),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("lib/images/paper.png"),
                  Container(
                    height: 47,
                    width: 336,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromRGBO(243, 241, 241, 1),
                    ),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: GestureDetector(
                            child: Icon(Icons.face),
                            onTap: () {},
                          ),
                          suffixIcon: Icon(Icons.telegram_outlined),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
