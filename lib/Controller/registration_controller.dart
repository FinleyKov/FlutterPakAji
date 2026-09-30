import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutirprojak/routes.dart';

class RegistrationController extends GetxController {
  final txtNama = TextEditingController();
  final txtPassword = TextEditingController();
  
  var isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void sendData() {
    if (txtNama.text.trim().isEmpty || txtPassword.text.trim().isEmpty) {
      Get.snackbar(
        "Peringatan",
        "Nama dan Password wajib diisi!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    Get.toNamed(Routes.confirmRegistration, arguments: {
      'name': txtNama.text,
      'password': txtPassword.text,
      'jenis_kelamin': "Laki-laki",
    });
  }

  @override
  void onClose() {
    txtNama.dispose();
    txtPassword.dispose();
    super.onClose();
  }
}