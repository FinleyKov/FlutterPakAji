import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutirprojak/routes.dart';

class LoginCloneController extends GetxController {
  // Controller untuk input teks username dan password
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  // Alias agar tetap kompatibel jika dipanggil dengan nama lain
  TextEditingController get usernameController => txtUsername;
  TextEditingController get passwordController => txtPassword;

  // Status loading reaktif (.obs)
  var isLoading = false.obs;

  // Method untuk melakukan hit API POST login ke https://mediadwi.com/api/latihan/login
  void login() async {
    final username = txtUsername.text.trim();
    final password = txtPassword.text.trim();

    // 1. Validasi jika input username atau password kosong
    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Peringatan",
        "Username dan password harus terisi!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade800,
        colorText: Colors.white,
        margin: const EdgeInsets.all(12),
        icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
      );
      return;
    }

    try {
      isLoading.value = true;
      final Uri url = Uri.parse("https://mediadwi.com/api/latihan/login");

      // 2. HTTP POST Request ke API login
      final response = await http.post(
        url,
        body: {
          "username": username,
          "password": password,
        },
      ).timeout(const Duration(seconds: 15));

      isLoading.value = false;

      // 3. Pengecekan status code respons
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == true) {
          Get.snackbar(
            "Berhasil",
            data['message']?.toString() ?? "Login berhasil!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color(0xFF1B5E20),
            colorText: Colors.white,
            margin: const EdgeInsets.all(12),
            icon: const Icon(Icons.check_circle, color: Colors.white),
          );

          // Pindah ke Main Menu / Menu Drawer dan tutup halaman login (get.off)
          Get.offNamed(Routes.menuDrawer);
        } else {
          Get.snackbar(
            "Gagal",
            data['message']?.toString() ?? "Username atau password salah!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade800,
            colorText: Colors.white,
            margin: const EdgeInsets.all(12),
            icon: const Icon(Icons.error_outline, color: Colors.white),
          );
        }
      } else {
        Get.snackbar(
          "Error",
          "Gagal menghubungi server (Status: ${response.statusCode})",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade900,
          colorText: Colors.white,
          margin: const EdgeInsets.all(12),
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        "Gagal",
        "Terjadi kesalahan koneksi: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade900,
        colorText: Colors.white,
        margin: const EdgeInsets.all(12),
      );
    }
  }

  @override
  void onClose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.onClose();
  }
}
