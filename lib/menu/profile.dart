import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutirprojak/controller/profile_controller.dart'; // Import controller

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // Panggil controller di sini
  final ProfileController profileController = Get.put(ProfileController());

  static const Color woodDark = Color(0xFF2B1B10);
  static const Color woodPlank = Color(0xFF3E2723);
  static const Color woodBorder = Color(0xFF6D4C41);
  static const Color lt2Green = Color(0xFF1B5E20);
  static const Color lt2Gold = Color(0xFFFFB300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: woodDark,
      appBar: AppBar(
        title: const Text(
          "LUMBERJACK PROFILE",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: woodPlank,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: woodPlank,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: woodBorder, width: 2.5),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: Color(0xFF1C1008),
                    child: Icon(Icons.person, size: 50, color: lt2Gold),
                  ),
                  const SizedBox(height: 12),
                  // Menggunakan data dari Controller dengan Obx
                  Obx(() => Text(
                        profileController.playerName.value,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  const SizedBox(height: 4),
                  Obx(() => Text(
                        profileController.playerRank.value,
                        style: const TextStyle(color: Color(0xFFFFD54F), fontSize: 14),
                      )),
                  const Divider(color: woodBorder, height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Obx(() => _buildStatItem("Lumber Bucks", profileController.lumberBucks.value)),
                      Obx(() => _buildStatItem("Rare Axes", profileController.rareAxes.value)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String title, String value) {
    return Column(
      children: [
        Text(title, style: const TextStyle(color: Color(0xFFA1887F), fontSize: 12)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: lt2Green,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            value,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}