import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutirprojak/controller/menu_drawer_controller.dart';
import 'package:flutirprojak/routes.dart';

class MenuDrawerPage extends StatelessWidget {
  const MenuDrawerPage({super.key});

  static const Color woodDark = Color(0xFF2B1B10);
  static const Color woodPlank = Color(0xFF3E2723);
  static const Color woodBorder = Color(0xFF6D4C41);
  static const Color lt2Gold = Color(0xFFFFB300);

  @override
  Widget build(BuildContext context) {

    final MenuDrawerController controller = Get.put(MenuDrawerController());

    return Obx(
      () => Scaffold(
        backgroundColor: woodDark,
        appBar: AppBar(
          title: const Text(
            "LT2 DRAWER NAVIGATION",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
          backgroundColor: woodPlank,
          elevation: 4,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        // Sesuai coretan: Di dalam scaffold ada nav drawer
        drawer: Drawer(
          backgroundColor: woodDark,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: woodPlank,
                  border: Border(bottom: BorderSide(color: woodBorder, width: 2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      backgroundColor: Color(0xFF1C1008),
                      radius: 28,
                      child: Icon(Icons.store, color: lt2Gold, size: 30),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Woodman Menu",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Lumber Tycoon 2",
                      style: TextStyle(color: Color(0xFFA1887F), fontSize: 12),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home, color: lt2Gold),
                title: const Text("Home", style: TextStyle(color: Colors.white)),
                onTap: () {
                  controller.changePage(0); // Memanggil action di controller
                  Get.back(); // Menutup drawer setelah diklik
                },
              ),
              ListTile(
                leading: const Icon(Icons.sports_esports, color: lt2Gold),
                title: const Text("Game Store (API)", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Get.back(); // Menutup drawer setelah diklik
                  Get.toNamed(Routes.listProduk);
                },
              ),
              ListTile(
                leading: const Icon(Icons.history, color: lt2Gold),
                title: const Text("History", style: TextStyle(color: Colors.white)),
                onTap: () {
                  controller.changePage(1);
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.person, color: lt2Gold),
                title: const Text("Profile", style: TextStyle(color: Colors.white)),
                onTap: () {
                  controller.changePage(2);
                  Get.back();
                },
              ),
              const Divider(color: woodBorder),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.redAccent),
                title: const Text("Log Out", style: TextStyle(color: Colors.redAccent)),
                onTap: () {
                  Get.back();
                  Get.offAllNamed(Routes.loginClone);
                },
              ),
            ],
          ),
        ),
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.listPages,
        ),
      ),
    );
  }
}