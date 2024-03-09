import 'package:bkash/controller/profile_setupController.dart';
import 'package:bkash/global_widgets/customButton.dart';
import 'package:bkash/global_widgets/customFeild.dart';
import 'package:bkash/navBarView/navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profileSetupView extends StatelessWidget {
  final email;
  profileSetupView({super.key, this.email});

  final controller = Get.put(ProfileSetupController());

  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final nidcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complete setup"),
        backgroundColor: const Color.fromARGB(255, 230, 29, 96),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          "https://e1.pxfuel.com/desktop-wallpaper/106/243/desktop-wallpaper-tom-and-jerry-png-cartoon-characters-tom-and-jerry-cartoon.jpg"),
                    ),
                    InkWell(
                      onTap: () => controller.imagePicker(),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 230, 29, 96),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            )),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextfeild(
                  title: "Enter Your Ful Name",
                  controller: namecontroller,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextfeild(
                  title: "Enter Your Phone Number",
                  controller: phonecontroller,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextfeild(
                  title: "Ebter Your NID Number",
                  controller: nidcontroller,
                ),
              ]),
              CustomButton(
                title: "Complete Setup",
                onTap: () async {
                  await FirebaseFirestore.instance
                      .collection("user")
                      .doc(email)
                      .set({
                    "Email": email,
                    "Full Name": namecontroller.text,
                    "Phone Number": phonecontroller.text,
                    "NID Number": nidcontroller.text,
                    // "profile picture":
                    "balance": 0,
                  }).then((value) {
                    Get.offAll(() => NavBarView());
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
