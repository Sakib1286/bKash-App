import 'package:bkash/global_widgets/customButton.dart';
import 'package:bkash/global_widgets/customFeild.dart';
import 'package:bkash/navBarView/navbar.dart';
import 'package:bkash/send_money.dart/ammondview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceiveView extends StatelessWidget {
  const ReceiveView({super.key});

  @override
  Widget build(BuildContext context) {
    final recevierEmailController = TextEditingController();
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Money"),
        backgroundColor: Color.fromARGB(255, 230, 29, 96),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NavBarView()));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextfeild(
              title: "Ënter Recevier E-mail Address",
              controller: recevierEmailController,
            ),
            CustomButton(
                title: "Send",
                onTap: () async {
                  final receiver = await FirebaseFirestore.instance
                      .collection('user')
                      .doc(recevierEmailController.text)
                      .get();

                  final sender = await FirebaseFirestore.instance
                      .collection('user')
                      .doc(user!.email)
                      .get();

                  final receiverData = receiver.data();
                  if (receiverData == null) {
                    Get.snackbar("User Not Exist",
                        'The User ${recevierEmailController.text}Not Exist');
                  } else {
                    if (receiverData['Email'] == user.email) {
                      Get.snackbar("Error", "You cannot Send Money Yourself");
                    } else {
                      Get.to(
                        () => AmmoundView(
                          receiverDetails: receiverData,
                          senderDetails: sender.data()!,
                        ),
                      );
                    }
                  }
                })
          ],
        ),
      ),
    );
  }
}
