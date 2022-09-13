// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dateapp/constants/constwidgets.dart';
import 'package:dateapp/pages/chatpage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  final id = 'chat_screen';

  @override
  Widget build(BuildContext context) {
    final names = [
      'Josie jackson',
      'Nathan Martin',
      'JacKson Martin',
      'Lopez Jossie',
    ];

    final messages = [
      'Yeah, we can have a look',
      'Sent an attachment',
      'Greate, i will have a look',
    ];

    final images = [
      'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'https://media.istockphoto.com/photos/excited-woman-wearing-rainbow-cardigan-picture-id1327495437?b=1&k=20&m=1327495437&s=170667a&w=0&h=Vbl-XLyAnBoTkyGXXi-X1CFzuSHlNcn-dqB-sCosxFo=',
      'https://media.istockphoto.com/photos/happy-millennial-afro-american-business-woman-posing-isolated-on-picture-id1386479313?b=1&k=20&m=1386479313&s=170667a&w=0&h=axEYGqmMKgDx8nk47CRAuGc27P1mnEu3zDJCdK7WlsE=',
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'https://media.istockphoto.com/photos/shot-of-a-handsome-young-man-standing-against-a-grey-background-picture-id1335941248?b=1&k=20&m=1335941248&s=170667a&w=0&h=sn_An6VRQBtK3BuHnG1w9UmhTzwTqM3xLnKcqLW-mzw=',
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
                "Chats",
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Messages',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return MyTile(
                            title: names[index],
                            imgUrl: images[index],
                          );
                          // return Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: 20, vertical: 8.0),
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       Navigator.push(context,
                          //           MaterialPageRoute(builder: (context) {
                          //         return ChatPage();
                          //       }));
                          //     },
                          //     child: Container(
                          //       height: 56,
                          //       width: 353,
                          //       decoration: BoxDecoration(
                          //         color: Colors.greenAccent,
                          //         borderRadius: BorderRadius.circular(12),
                          //       ),
                          //       child: Center(
                          //         child: ListTile(
                          //           trailing: Column(
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.end,
                          //               children: [
                          //                 Text(
                          //                   "Date time",
                          //                   style: TextStyle(
                          //                     fontSize: 14,
                          //                     color:
                          //                         Color.fromRGBO(0, 0, 0, 0.6),
                          //                   ),
                          //                 ),
                          //                 CircleAvatar(
                          //                   radius: 10,
                          //                 )
                          //               ]),
                          //           // leading: CircleAvatar(),
                          //           leading: ClipRRect(
                          //             borderRadius: BorderRadius.circular(50),
                          //             child: Container(
                          //               height: 38,
                          //               width: 38,
                          //               decoration: BoxDecoration(
                          //                 color: Colors.blue,
                          //               ),
                          //               child: Image.network(
                          //                 images[index],
                          //                 fit: BoxFit.fill,
                          //               ),
                          //             ),
                          //           ),
                          //           title: Text(
                          //             names[index],
                          //             style: TextStyle(fontSize: 18),
                          //           ),
                          //           subtitle: Text(
                          //             messages[index],
                          //             style: TextStyle(
                          //               fontSize: 12,
                          //             ),
                          //           ),
                          //         ),
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
      ),
    );
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
            borderRadius: BorderRadius.circular(50),
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
          trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Date time",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                  ),
                ),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.deepPurple.withOpacity(0.8),
                  child: Text(
                    "0",
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ]),
          title: Text(title),
          subtitle: MySubTitle(),
        ),
      ),
    );
  }
}
