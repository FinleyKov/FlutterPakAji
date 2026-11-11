import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutirprojak/routes.dart';

class LoginCloneController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;

  void login() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "Peringatan",
        "Username dan Password tidak boleh kosong!",
        backgroundColor: Colors.red.shade800,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    // Menampilkan Dialog Loading & Pengecekan Internet
    Get.dialog(
      PopScope(
        canPop: false,
        child: AlertDialog(
          backgroundColor: const Color(0xFF3E2723), // Tema kayu Lumber Tycoon 2
          title: const Text(
            "Connecting to Server...",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(color: Color(0xFFFFB300)),
              SizedBox(height: 20),
              Text(
                "Memeriksa koneksi internet / WiFi...\n(Jika WiFi mati, loading akan berputar terus sampai dihidupkan)",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFFA1887F), fontSize: 13),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );

    // Looping pengecekan koneksi internet secara real-time
    bool isConnected = false;
    while (!isConnected) {
      try {
        var connectivityResult = await Connectivity().checkConnectivity();
        if (connectivityResult.contains(ConnectivityResult.none)) {
          isConnected = false;
        } else {
          isConnected = true;
        }
      } catch (e) {
        isConnected = false;
      }

      if (!isConnected) {
        await Future.delayed(const Duration(seconds: 2));
      }
    }

    isLoading.value = false;
    await Future.delayed(const Duration(seconds: 1));

    Get.back(); // Tutup dialog loading
    Get.offAllNamed(Routes.menuDrawer); // Masuk otomatis ke Menu Drawer
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}