import 'package:bkash/activitys/activity.dart';
import 'package:bkash/global_widgets/custom_homeItem.dart';
import 'package:bkash/global_widgets/custom_listtile.dart';
import 'package:bkash/send_money.dart/receive_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * .35,
            width: size.width,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 29, 96),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40))),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('user')
                      .doc(user!.email)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // return const CircularProgressIndicator();
                      return Image.asset(
                          'assets/images/Animation - 1709231553099.gif');
                    } else {
                      final data = snapshot.data!.data()!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/bkashBird.png',
                                height: 50,
                                width: 50,
                              ),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(.5)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://w0.peakpx.com/wallpaper/396/439/HD-wallpaper-tom-and-jerry-angry-jerry-tom-and-jerry-angry-jerry-cartoon-anime.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                          Text(
                            " Hello , ${data['Full Name']}",
                            style: TextStyle(
                                color: Colors.white.withOpacity(.9),
                                fontSize: 18),
                          ),
                          Column(
                            children: [
                              Text(
                                '\$${data['balance']}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35),
                              ),
                              Text(
                                " Your Balance",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.9),
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                  }),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReceiveView()));
                        },
                        child: HomeItem(
                          title: "Send \n Money",
                          icon: Icons.send,
                          backgroundColor: Color.fromARGB(255, 230, 29, 96),
                          itemColor: Colors.white,
                        ),
                      ),
                      HomeItem(
                        title: "Receive \n Money",
                        icon: Icons.monetization_on,
                        backgroundColor: Colors.white,
                        itemColor: Color.fromARGB(255, 230, 29, 96),
                        onTap: () async {
                          print(await FirebaseMessaging.instance.getToken());
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Activitys",
                        style: TextStyle(color: Colors.pink),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ActivityView()));
                        },
                        child: Text(
                          "See All",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('history')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            primary: false,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              final data = snapshot.data!.docs[index];

                              bool isMe = data['sender_email'] == user.email;
                              bool ifIAmReceiver =
                                  data['receiver_email'] == user.email;

                              DateTime trxTime =
                                  (data['time'] as Timestamp).toDate();

                              final formatedDate =
                                  DateFormat.yMMMd().format(trxTime);
                              final formatedTime =
                                  DateFormat.jm().format(trxTime);

                              return isMe || ifIAmReceiver
                                  ? CustomListtile(
                                      title: isMe
                                          ? data['recevier']
                                          : data['sender'],
                                      subtitle: '$formatedDate - $formatedTime',
                                      trailing: isMe
                                          ? '-${data['amound']}'
                                          : '+${data['amound']}',
                                    )
                                  : const SizedBox();
                            },
                          );
                        }
                      })
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
