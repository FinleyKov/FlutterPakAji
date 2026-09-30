import 'package:flutter/material.dart';
import 'package:flutirprojak/component/roblox_button.dart'; // Import custom button

class LoginClone extends StatefulWidget {
  const LoginClone({super.key});

  @override
  State<LoginClone> createState() => _LoginCloneState();
}

class _LoginCloneState extends State<LoginClone> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF191B1D);
    const cardColor = Color(0xFF232527);
    const inputFillColor = Color(0xFF393B3D);
    const primaryTextColor = Colors.white;
    const secondaryTextColor = Color(0xFFA1A4A6);

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

                // Logo Roblox
                Transform.rotate(
                  angle: -0.15, // Efek miring khas logo Roblox
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
                Text(
                  'ROBLOX',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900, // Menggunakan w900 (pengganti black)
                    color: primaryTextColor,
                    letterSpacing: 4,
                  ),
                ),

                const SizedBox(height: 36),

                // Card Login
                Container(
                  padding: const EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(12),
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

                      // Input Username/Email/Phone
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

                      // Tombol Login (Menggunakan RobloxButton)
                      RobloxButton(
                        text: 'Log In',
                        onPressed: () {},
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