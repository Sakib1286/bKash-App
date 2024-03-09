import 'package:bkash/global_widgets/custom_listtile.dart';
import 'package:bkash/navBarView/navbar.dart';
import 'package:flutter/material.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Activitys"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 230, 29, 96),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NavBarView()));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return const CustomListtile(
                title: "IH Rabbi",
                subtitle: "6 days ago",
                trailing: "+500\$",
              );
            }),
      ),
    );
  }
}
