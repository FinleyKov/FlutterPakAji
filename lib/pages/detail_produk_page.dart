import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutirprojak/controller/detail_produk_controller.dart';
import 'package:flutirprojak/component/custom_header.dart';

class DetailProdukPage extends StatelessWidget {
  const DetailProdukPage({super.key});

  static const Color woodDark = Color(0xFF1E120B);
  static const Color woodCard = Color(0xFF2C1A10);
  static const Color woodBorder = Color(0xFF5D4037);
  static const Color lt2Green = Color(0xFF2E7D32);

  @override
  Widget build(BuildContext context) {
    final DetailProdukController controller = Get.put(DetailProdukController());
    final produk = controller.produk;

    return Scaffold(
      backgroundColor: woodDark,
      appBar: CustomHeader(title: produk.namaProduk),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: const Color(0xFF100905),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: woodBorder, width: 3),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: Image.network(
                  produk.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: woodCard,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: woodBorder, width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          produk.namaProduk,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: lt2Green,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: const Color(0xFF66BB6A)),
                        ),
                        child: Text(
                          produk.harga,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.storefront_rounded, color: Color(0xFFFFB300), size: 18),
                      const SizedBox(width: 6),
                      Text(
                        produk.developer,
                        style: const TextStyle(color: Color(0xFFD7CCC8), fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.verified_rounded, color: Colors.amber, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        produk.rating,
                        style: const TextStyle(color: Color(0xFFFFD54F), fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Divider(color: woodBorder, height: 28, thickness: 1.5),
                  const Text(
                    "ITEM STATS & DESCRIPTION",
                    style: TextStyle(
                      color: Color(0xFFA1887F),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    produk.deskripsi,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B5E20),
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFF4CAF50), width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  Get.snackbar(
                    "PURCHASE SUCCESSFUL",
                    "Kamu membeli ${produk.namaProduk} seharga ${produk.harga}!",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: const Color(0xFF1B5E20),
                    colorText: Colors.white,
                    borderColor: const Color(0xFF81C784),
                    borderWidth: 1.5,
                    margin: const EdgeInsets.all(12),
                    icon: const Icon(Icons.check_circle, color: Colors.white),
                  );
                },
                child: const Text(
                  "BUY ITEM",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}