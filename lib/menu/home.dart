import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutirprojak/controller/list_produk_controller.dart';
import 'package:flutirprojak/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Warna Khas Lumber Tycoon 2
  static const Color woodDark = Color(0xFF2B1B10);
  static const Color woodPlank = Color(0xFF3E2723);
  static const Color woodBorder = Color(0xFF6D4C41);
  static const Color lt2Gold = Color(0xFFFFB300);

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller produk untuk mengambil list data game/produk dari API
    final controller = Get.put(ListProdukController());

    return Scaffold(
      backgroundColor: woodDark,
      appBar: AppBar(
        title: const Text(
          "WOODMAN STORE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: woodPlank,
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Menuju List Produk / Game Store Page
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: woodPlank,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: lt2Gold, width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 6,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.storefront_rounded, color: lt2Gold, size: 40),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Game Store Catalog",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Jelajahi seluruh koleksi game online gratis",
                          style: TextStyle(
                            color: Color(0xFFA1887F),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B5E20),
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFF4CAF50)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    onPressed: () => Get.toNamed(Routes.listProduk),
                    child: const Text("Buka"),
                  ),
                ],
              ),
            ),

            // Judul Bagian
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.category, color: lt2Gold, size: 20),
                    SizedBox(width: 8),
                    Text(
                      "Featured Games (Horizontal)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.listProduk),
                  child: const Text(
                    "Lihat Semua >",
                    style: TextStyle(color: lt2Gold, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Horizontal ListView Produk (Membaca data reaktif dari Controller)
            SizedBox(
              height: 250,
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(color: lt2Gold),
                  );
                }

                if (controller.gameList.isEmpty) {
                  return const Center(
                    child: Text(
                      "Tidak ada data game",
                      style: TextStyle(color: Colors.white70),
                    ),
                  );
                }

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.gameList.length,
                  itemBuilder: (context, index) {
                    final produk = controller.gameList[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.detailProduk, arguments: produk);
                      },
                      child: Container(
                        width: 170,
                        margin: const EdgeInsets.only(right: 12, bottom: 8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: woodPlank,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: woodBorder, width: 2),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 4,
                              offset: Offset(2, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Frame Gambar
                            Container(
                              width: double.infinity,
                              height: 120,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1C1008),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: woodBorder),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  produk.imagePath,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.broken_image, color: Colors.amber),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Nama Produk
                            Text(
                              produk.namaProduk,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 2),
                            // Toko / Developer
                            Text(
                              produk.developer,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xFFA1887F),
                                fontSize: 11,
                              ),
                            ),
                            const Spacer(),
                            // Badge Harga
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1B5E20),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: const Color(0xFF4CAF50)),
                              ),
                              child: Text(
                                produk.harga,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
