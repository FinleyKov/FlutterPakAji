import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutirprojak/component/roblox_button.dart';
import 'package:flutirprojak/controller/login_clone_controller.dart';
import 'package:flutirprojak/routes.dart';

class LoginClonePage extends StatelessWidget {
  LoginClonePage({super.key});

  final LoginCloneController controller = Get.put(LoginCloneController());

  // Warna Khas Tema Dark Mode Roblox
  static const Color backgroundColor = Color(0xFF191B1D);
  static const Color cardColor = Color(0xFF232527);
  static const Color inputFillColor = Color(0xFF393B3D);
  static const Color primaryTextColor = Colors.white;
  static const Color secondaryTextColor = Color(0xFFA1A4A6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 24),

                // Logo Ikon Khas Roblox (Kotak Miring dengan Lubang di Tengah)
                Transform.rotate(
                  angle: -0.15,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Container(
                        width: 20,
                        height: 20,
                        color: backgroundColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Tulisan ROBLOX
                const Text(
                  'ROBLOX',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: primaryTextColor,
                    letterSpacing: 4,
                  ),
                ),

                const SizedBox(height: 32),

                // Card Box Form Login
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: primaryTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),

                      // Input Username
                      TextField(
                        controller: controller.txtUsername,
                        style: const TextStyle(color: primaryTextColor),
                        decoration: InputDecoration(
                          hintText: 'Username/Email/Phone',
                          hintStyle: const TextStyle(color: secondaryTextColor, fontSize: 14),
                          filled: true,
                          fillColor: inputFillColor,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Input Password
                      TextField(
                        controller: controller.txtPassword,
                        obscureText: true,
                        style: const TextStyle(color: primaryTextColor),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: secondaryTextColor, fontSize: 14),
                          filled: true,
                          fillColor: inputFillColor,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Tombol Login dengan Reaktif Obx Loading Indicator
                      Obx(
                        () => controller.isLoading.value
                            ? const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 3,
                                  ),
                                ),
                              )
                            : RobloxButton(
                                text: 'Log In',
                                onPressed: () {
                                  controller.login();
                                },
                              ),
                      ),
                      const SizedBox(height: 12),

                      // Tombol Lupa Password
                      TextButton(
                        onPressed: () {
                          Get.snackbar(
                            "Bantuan",
                            "Silakan hubungi administrator atau lakukan reset akun.",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: inputFillColor,
                            colorText: Colors.white,
                          );
                        },
                        child: const Text(
                          'Forgot Password or Username?',
                          style: TextStyle(
                            color: secondaryTextColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Tombol Sign Up Outlined
                SizedBox(
                  width: double.infinity,
                  child: RobloxButton(
                    text: 'Sign Up',
                    isOutlined: true,
                    onPressed: () {
                      Get.toNamed(Routes.registration);
                    },
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
