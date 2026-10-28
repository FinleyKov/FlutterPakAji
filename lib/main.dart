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
      title: "Lumber Tycoon 2 Store",
      initialRoute: Routes.menuDrawer,
      getPages: Routes.myPages,
    );
  }
}