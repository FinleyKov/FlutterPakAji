import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutirprojak/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Roblox App",
      theme: ThemeData.dark(),
      initialRoute: Routes.loginClone,
      getPages: Routes.myPages,
    );
  }
}
