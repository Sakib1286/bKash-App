import 'package:bkash/profile_setup/profile_setup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global_widgets/customButton.dart';
import '../../../global_widgets/customFeild.dart';
import 'login.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                              .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);
                          print("Hello");
                          //navigation
                          Get.offAll(() => profileSetupView(
                                email: emailController.text,
                              ));
                        } on FirebaseAuthException catch (error) {
                          print(error);
                        }
                      },
                      title: "Signup"),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Already Have An Account ?",
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
                                builder: (context) => LoginView()));
                      },
                      child: Text(
                        "Login",
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
