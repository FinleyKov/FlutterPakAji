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
      title: "Belajar Flutter PPLG 3",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6C63FF)),
        useMaterial3: true,
      ),
      initialRoute: Routes.registration,
      getPages: Routes.myPages,
    );
  }
}