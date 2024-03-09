import 'package:bkash/global_widgets/customButton.dart';
import 'package:bkash/global_widgets/customFeild.dart';

import 'package:bkash/navBarView/navbar.dart';
import 'package:bkash/views/auth/login/registerView.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/images.png"),
              Column(
                children: [
                  CustomTextfeild(
                    title: "Enter Your Email",
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomTextfeild(
                    title: "Enter Your Password",
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                      onTap: () async {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);

                          Get.offAll(() => NavBarView());
                        } on FirebaseAuthException catch (error) {
                          print(error);
                          Get.snackbar("Error", error.message!);
                        }
                      },

                      /*onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NavBarView()));
                      },*/
                      title: "Login"),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Having Trouble in logging in ?",
                    style: TextStyle(color: Colors.black.withOpacity(.5)),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterView()));
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(
                            color: Colors.pink, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
