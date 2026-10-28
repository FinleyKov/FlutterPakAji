import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutirprojak/menu/home.dart';
import 'package:flutirprojak/menu/history.dart';
import 'package:flutirprojak/menu/profile.dart';

class MenuDrawerController extends GetxController {
  // Menyimpan indeks halaman yang sedang aktif secara reaktif (.obs)
  RxInt selectedIndex = 0.obs;

  // Fungsi untuk mengubah halaman (action dipindah ke controller)
  void changePage(int index) {
    selectedIndex.value = index;
  }

  // Daftar halaman yang akan ditampilkan di dalam body menggunakan IndexedStack
  List<Widget> listPages = [
    HomePage(),
    HistoryPage(),
    ProfilePage(),
  ];
}