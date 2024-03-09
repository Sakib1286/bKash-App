import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const CustomButton({super.key, this.onTap, required this.title});



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink,
              borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 15,
          vertical: 20,
          ),
            child: Text(title,
            style: TextStyle(color: Colors.white,
            fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            ),
          ),
        ),

      ),
    );
  }


}
