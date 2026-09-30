import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutirprojak/Controller/confirm_registration_controller.dart';
import 'package:flutirprojak/component/primary_button.dart';

class ConfirmRegistrationPage extends StatelessWidget {
  const ConfirmRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConfirmRegistrationController());

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text("Konfirmasi Data", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shadowColor: Colors.black.withOpacity(0.08),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 36,
                      backgroundColor: Color(0xFFECEBFF),
                      child: Icon(Icons.check_circle_outline, size: 40, color: Color(0xFF6C63FF)),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Periksa Data Anda",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Divider(height: 32),
                    Obx(() => _buildInfoRow("Nama", controller.nama.value, Icons.person)),
                    const SizedBox(height: 12),
                    Obx(() => _buildInfoRow("Password", controller.password.value, Icons.lock, isMasked: true)),
                    const SizedBox(height: 12),
                    Obx(() => _buildInfoRow("Jenis Kelamin", controller.jenisKelamin.value, Icons.wc)),
                  ],
                ),
              ),
            ),
            const Spacer(),
            PrimaryButton(
              text: "Selesai",
              icon: Icons.check,
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon, {bool isMasked = false}) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF6C63FF)),
        const SizedBox(width: 12),
        Text(
          "$label:",
          style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
        ),
        const Spacer(),
        Text(
          isMasked ? '•' * value.length : value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ],
    );
  }
}