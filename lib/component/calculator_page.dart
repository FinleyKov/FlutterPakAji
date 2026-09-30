import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import ini dibutuhkan untuk TextInputFormatter
import 'package:get/get.dart';
import 'package:flutirprojak/Controller/calculator_Controller.dart'; 

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final KalkulatorController controller = Get.put(KalkulatorController());

  final TextEditingController input1Controller = TextEditingController();
  final TextEditingController input2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Sederhana'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input Angka 1 (Hanya Angka & Titik/Koma untuk Desimal)
            TextField(
              controller: input1Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
              decoration: const InputDecoration(
                labelText: 'Angka Pertama',
                hintText: 'Masukkan angka...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Input Angka 2 (Hanya Angka & Titik/Koma untuk Desimal)
            TextField(
              controller: input2Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Angka Kedua',
                hintText: 'Masukkan angka...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            // Tombol Operasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    double a1 = double.tryParse(input1Controller.text) ?? 0;
                    double a2 = double.tryParse(input2Controller.text) ?? 0;
                    controller.tambah(a1, a2);
                  },
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    double a1 = double.tryParse(input1Controller.text) ?? 0;
                    double a2 = double.tryParse(input2Controller.text) ?? 0;
                    controller.kurang(a1, a2);
                  },
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    double a1 = double.tryParse(input1Controller.text) ?? 0;
                    double a2 = double.tryParse(input2Controller.text) ?? 0;
                    controller.kali(a1, a2);
                  },
                  child: const Text('×'),
                ),
                ElevatedButton(
                  onPressed: () {
                    double a1 = double.tryParse(input1Controller.text) ?? 0;
                    double a2 = double.tryParse(input2Controller.text) ?? 0;
                    controller.bagi(a1, a2);
                  },
                  child: const Text('÷'),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Hasil
            Obx(
              () => Text(
                'Hasil: ${controller.hasilHitung.value}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}