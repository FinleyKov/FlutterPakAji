import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutirprojak/Controller/registration_controller.dart';
import 'package:flutirprojak/component/custom_text_field.dart';
import 'package:flutirprojak/component/primary_button.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: const Text("Registration", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Buat Akun Baru 👋",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3142),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Silakan isi data diri Anda di bawah ini.",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 32),

            CustomTextField(
              labelText: "Nama Lengkap",
              hintText: "Masukkan nama Anda",
              txtController: controller.txtNama,
              prefixIcon: Icons.person_outline,
            ),

            Obx(() => CustomTextField(
              labelText: "Password",
              hintText: "Masukkan password Anda",
              txtController: controller.txtPassword,
              prefixIcon: Icons.lock_outline,
              isPassword: true,
              isObscure: controller.isPasswordHidden.value,
              onToggleVisibility: () => controller.togglePasswordVisibility(),
            )),

            const SizedBox(height: 24),

            PrimaryButton(
              text: "Lanjutkan",
              icon: Icons.arrow_forward,
              onPressed: () {
                controller.sendData();
              },
            ),
          ],
        ),
      ),
    );
  }
}