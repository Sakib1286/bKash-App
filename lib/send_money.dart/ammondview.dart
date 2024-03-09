import 'package:bkash/global_widgets/customButton.dart';
import 'package:bkash/global_widgets/customFeild.dart';
import 'package:bkash/send_money.dart/receive_view.dart';
import 'package:bkash/send_money.dart/successView.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AmmoundView extends StatelessWidget {
  final Map<String, dynamic> receiverDetails;
  final Map<String, dynamic> senderDetails;
  const AmmoundView(
      {super.key, required this.receiverDetails, required this.senderDetails});
  transactionHistory(String amound) {
    FirebaseFirestore.instance.collection('history').add({
      'sender': senderDetails['Full Name'],
      'recevier': receiverDetails['Full Name'],
      'amound': amound,
      'time': DateTime.now(),
      'type': 'send',
      'sender_email': senderDetails['Email'],
      'receiver_email': receiverDetails['Email'],
    });
  }

  @override
  Widget build(BuildContext context) {
    final amoundController = TextEditingController();

    //transection
    transferMoney() {
      final amound = int.parse(amoundController.text);
      FirebaseFirestore.instance
          .collection('user')
          .doc(senderDetails['Email'])
          .update({'balance': senderDetails['balance'] -= amound}).then(
              (value) {
        FirebaseFirestore.instance
            .collection('user')
            .doc(receiverDetails['Email'])
            .update({'balance': receiverDetails['balance'] += amound}).then(
                (value) {
          transactionHistory(amoundController.text);

          Get.offAll(() => SuccessView(
              email: receiverDetails['Email'], amound: amoundController.text));
        });
      });
    }

    //transection History

    return Scaffold(
      appBar: AppBar(
        title: Text("Send Money"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 230, 29, 96),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ReceiveView()));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(.2)),
                  title: Text(
                    "To",
                    style: TextStyle(color: Colors.black.withOpacity(.5)),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        receiverDetails['Full Name'],
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(receiverDetails['Email'],
                          style:
                              TextStyle(color: Colors.black.withOpacity(.5))),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextfeild(
                        controller: amoundController,
                        title: "Enter Ammound",
                        prefixIcon: Icons.attach_money_outlined,
                        keyboard: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Available Balance \$${senderDetails['balance']}",
                          style:
                              TextStyle(color: Colors.black.withOpacity(.5))),
                    ],
                  ),
                ),
              ],
            ),
            CustomButton(
              title: "Send",
              onTap: () {
                final int ammound = int.parse(amoundController.text);
                final int availableBalance = senderDetails['balance'];

                if (ammound > availableBalance) {
                  Get.snackbar(
                      "Insufficient Balance ", "You don't Have Enough Money");
                } else {
                  transferMoney();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
