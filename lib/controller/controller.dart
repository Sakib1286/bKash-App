import 'package:bkash/home/home_view.dart';
import 'package:bkash/views/auth/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NavBarController extends GetxController {
  RxInt currentIndex = RxInt(0);

  List<Widget> screens = [
    HomeView(),
    Center(
      child: Text("Contacts"),
    ),
    Center(
      child: Text("Wallets"),
    ),
    Center(
      child: ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Get.offAll(() => LoginView());
          },
          child: Text("Logout")),
    ),
  ];
  changeIndex(int index) {
    currentIndex.value = index;
    update();
  }
}
