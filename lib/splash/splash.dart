import 'dart:async';

import 'package:bkash/navBarView/navbar.dart';
import 'package:bkash/views/auth/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpalashView extends StatefulWidget {
  const SpalashView({super.key});

  @override
  State<SpalashView> createState() => _SpalashViewState();
}

class _SpalashViewState extends State<SpalashView> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      if (user == null) {
        Get.offAll(() => const LoginView());
      } else {
        Get.offAll(() => NavBarView());
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/Animation - 1709231553099.gif'),
      ),
    );
  }
}
