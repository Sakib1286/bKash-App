import 'package:bkash/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  String name = dotenv.get("name", fallback: "");
  String apiKey = dotenv.get("apiKey", fallback: "");
  String appId = dotenv.get("appId", fallback: "");
  String messagingSenderId = dotenv.get("messagingSenderId", fallback: "");
  String projectId = dotenv.get("projectId", fallback: "");
  String storageBucket = dotenv.get("storageBucket", fallback: "");

  print(name);
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: apiKey,
    appId: appId,
    messagingSenderId: messagingSenderId,
    projectId: projectId,
    storageBucket: storageBucket,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpalashView(),
    );
  }
}
