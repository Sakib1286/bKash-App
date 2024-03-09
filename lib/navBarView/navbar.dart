import 'package:bkash/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavBarController());
    return Obx(() => Scaffold(
          body: controller.screens[controller.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
              selectedFontSize: 18,
              unselectedFontSize: 10,
              selectedItemColor: Color.fromARGB(255, 230, 29, 96),
              unselectedItemColor: Colors.grey,
              currentIndex: controller.currentIndex.value,
              onTap: (index) => controller.changeIndex(index),
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.group), label: "Contacts"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.wallet), label: "Wallets"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Settings"),
              ]),
        ));
  }
}
