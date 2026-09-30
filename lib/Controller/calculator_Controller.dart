import 'package:get/get.dart';

class KalkulatorController extends GetxController {
  var hasilHitung = 0.0.obs;

  // Method tambah
  void tambah(double angka1, double angka2) {
    double hasil = angka1 + angka2;
    hasilHitung.value = hasil;
    Get.snackbar(
      "Hasil Penjumlahan",
      "$hasil",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Method kurang
  void kurang(double angka1, double angka2) {
    double hasil = angka1 - angka2;
    hasilHitung.value = hasil;
    Get.snackbar(
      "Hasil Pengurangan",
      "$hasil",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Method kali
  void kali(double angka1, double angka2) {
    double hasil = angka1 * angka2;
    hasilHitung.value = hasil;
    Get.snackbar(
      "Hasil Perkalian",
      "$hasil",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Method bagi
  void bagi(double angka1, double angka2) {
    if (angka2 == 0) {
      Get.snackbar(
        "Error",
        "Tidak bisa membagi dengan angka nol!",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    double hasil = angka1 / angka2;
    hasilHitung.value = hasil;
    Get.snackbar(
      "Hasil Pembagian",
      "$hasil",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}