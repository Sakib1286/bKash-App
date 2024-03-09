import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? backgroundColor;
  final Color? itemColor;
  final void Function()? onTap;

  const HomeItem({
    super.key,
    required this.title,
    required this.icon,
    this.backgroundColor,
    this.itemColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
        height: 130,
        width: size.width * .35,
        decoration: BoxDecoration(
            color: backgroundColor ?? Color.fromARGB(255, 230, 29, 96),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.20),
                blurRadius: 8,
              )
            ]),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                color: itemColor ?? Color.fromARGB(255, 230, 29, 96),
              ),
              Text(
                title,
                style: TextStyle(color: itemColor ?? Colors.white),
              )
            ],
          ),
        ));
  }
}
