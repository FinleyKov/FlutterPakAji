import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutirprojak/controller/list_produk_controller.dart';
import 'package:flutirprojak/component/custom_header.dart';
import 'package:flutirprojak/routes.dart';

class ListProdukPage extends StatelessWidget {
  ListProdukPage({super.key});

  final controller = Get.put(ListProdukController());
  
  static const Color woodDark = Color(0xFF2B1B10);
  static const Color woodPlank = Color(0xFF3E2723);
  static const Color woodBorder = Color(0xFF6D4C41);
  static const Color lt2Gold = Color(0xFFFFB300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: woodDark,
      appBar: const CustomHeader(title: "WOODMAN STORE - AXES"),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: controller.listProduk.length,
        itemBuilder: (context, index) {
          final produk = controller.listProduk[index];
          return GestureDetector(
            onTap: () {
              Get.toNamed(Routes.detailProduk, arguments: produk);
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: woodPlank,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: woodBorder, width: 2.5),
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
                  Container(
                    width: 110,
                    height: 110,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1008),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: woodBorder),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        produk.imagePath,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, color: Colors.amber),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Informasi Produk
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            produk.namaProduk,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Store: ${produk.developer}",
                            style: const TextStyle(
                              color: Color(0xFFA1887F),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.chevron_right_rounded,
                      color: lt2Gold,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}