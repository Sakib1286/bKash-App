import 'package:bkash/global_widgets/customFeild.dart';
import 'package:bkash/navBarView/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessView extends StatelessWidget {
  final String email;
  final String amound;

  const SuccessView({
    super.key,
    required this.email,
    required this.amound,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 90,
            ),
            Text(
              "Success !",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                  color: Colors.black),
            ),
            Text(
              "\$$amound USD",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black),
            ),
            Text(
              "has been send to $email from your wallet ",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.black.withOpacity(.5)),
            ),
            SizedBox(
              height: 50,
            ),
            CustomButton(
              title: "Done",
              onTap: () {
                Get.offAll(() => NavBarView());
              },
            )
          ],
        ),
      ),
    ));
  }
}
