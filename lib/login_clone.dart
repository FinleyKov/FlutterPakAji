import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutirprojak/component/roblox_button.dart';
import 'package:flutirprojak/routes.dart';

class LoginClone extends StatefulWidget {
  const LoginClone({super.key});

  @override
  State<LoginClone> createState() => _LoginCloneState();
}

class _LoginCloneState extends State<LoginClone> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Fungsi untuk menangani proses login & loading cek internet
  void _handleLogin() async {
    // 1. Validasi input kosong
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      Get.snackbar(
        "Peringatan",
        "Username dan Password tidak boleh kosong!",
        backgroundColor: Colors.red.shade800,
        colorText: Colors.white,
      );
      return;
    }

    // 2. Tampilkan Dialog Loading & Cek Koneksi WiFi
    Get.dialog(
      PopScope(
        canPop: false, // Mencegah dialog ditutup manual sebelum koneksi stabil
        child: AlertDialog(
          backgroundColor: const Color(0xFF3E2723), // Warna kayu LT2
          title: const Text(
            "Connecting to Server...",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(color: Color(0xFFFFB300)), // Aksen emas LT2
              SizedBox(height: 20),
              Text(
                "Memeriksa koneksi internet / WiFi...\n(Jika WiFi mati, loading akan terus berputar sampai dihidupkan kembali)",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFFA1887F), fontSize: 13),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );

    // 3. Looping pengecekan koneksi secara real-time
    bool isConnected = false;
    while (!isConnected) {
      try {
        var connectivityResult = await Connectivity().checkConnectivity();
        
        // Cek apakah hasilnya ada yang bukan 'none'
        if (connectivityResult.contains(ConnectivityResult.none)) {
          isConnected = false;
        } else {
          isConnected = true;
        }
      } catch (e) {
        isConnected = false;
      }

      // Jika internet mati, tunggu 2 detik lalu cek lagi (stuck muter terus)
      if (!isConnected) {
        await Future.delayed(const Duration(seconds: 2));
      }
    }

    // 4. Jika WiFi/Internet sudah nyala, tutup dialog dan masuk ke Menu Drawer
    await Future.delayed(const Duration(seconds: 1)); // Jeda sebentar
    Get.back(); // Tutup dialog loading
    Get.offAllNamed(Routes.menuDrawer); // Masuk otomatis ke halaman utama
  }

  @override
  Widget build(BuildContext context) {
    // === TEMA WARNA LUMBER TYCOON 2 ===
    const backgroundColor = Color(0xFF2B1B10); // Dark Oak Wood
    const cardColor = Color(0xFF3E2723);       // Wood Plank
    const inputFillColor = Color(0xFF1C1008);  // Deep Wood Input
    const primaryTextColor = Colors.white;
    const secondaryTextColor = Color(0xFFA1887F); // Light Wood Text
    const lt2Gold = Color(0xFFFFB300);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // Logo Roblox bertema Lumber Tycoon
                Transform.rotate(
                  angle: -0.15,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: lt2Gold,
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
                const Text(
                  'WOODMAN STORE',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: primaryTextColor,
                    letterSpacing: 2,
                  ),
                ),

                const SizedBox(height: 36),

                // Card Login
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Color(0xFF6D4C41), width: 2),
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
                        controller: _usernameController,
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
                        controller: _passwordController,
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

                      // Tombol Login (Memanggil _handleLogin untuk cek internet)
                      RobloxButton(
                        text: 'Log In',
                        onPressed: _handleLogin,
                      ),
                      const SizedBox(height: 12),

                      // Forgot Password
                      TextButton(
                        onPressed: () {},
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

                const SizedBox(height: 20),

                // Tombol Sign Up Outlined
                SizedBox(
                  width: double.infinity,
                  child: RobloxButton(
                    text: 'Sign Up',
                    isOutlined: true,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}