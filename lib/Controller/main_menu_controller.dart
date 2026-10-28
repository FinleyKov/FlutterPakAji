import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutirprojak/menu/home.dart';
import 'package:flutirprojak/menu/history.dart';
import 'package:flutirprojak/menu/profile.dart';

class MainMenuController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }
  
  List<Widget> listPages = [HomePage(),HistoryPage(),ProfilePage(),];
}