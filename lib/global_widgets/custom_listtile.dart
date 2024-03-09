import 'package:flutter/material.dart';

class CustomListtile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? trailing;
  const CustomListtile(
      {super.key, required this.title, required this.subtitle, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 254, 254),
          borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(.5),
          child: Text(
            title[0],
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        title: (Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
        subtitle: (Text(
          subtitle,
          style: TextStyle(color: Colors.black.withOpacity(.5)),
        )),
        trailing: trailing != null
            ? Text(
                trailing!,
                style: TextStyle(color: Colors.green, fontSize: 18),
              )
            : const SizedBox(),
      ),
    );
  }
}
