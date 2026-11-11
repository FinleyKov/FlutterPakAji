import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutirprojak/controller/list_produk_controller.dart';
import 'package:flutirprojak/component/custom_header.dart';
import 'package:flutirprojak/models/game_model.dart';
import 'package:flutirprojak/routes.dart';

class ListProdukPage extends StatelessWidget {
  ListProdukPage({super.key});

  final ListProdukController controller = Get.put(ListProdukController());

  // Tema Warna Khas Lumber Tycoon 2
  static const Color woodDark = Color(0xFF2B1B10);
  static const Color woodPlank = Color(0xFF3E2723);
  static const Color woodBorder = Color(0xFF6D4C41);
  static const Color lt2Gold = Color(0xFFFFB300);
  static const Color tagBg = Color(0xFF1C1008);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: woodDark,
      appBar: const CustomHeader(title: "GAME STORE - CATALOG"),
      body: Obx(() {
        // 1. Kondisi Loading saat hit API
        if (controller.isLoading.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(
                  color: lt2Gold,
                  strokeWidth: 3,
                ),
                SizedBox(height: 16),
                Text(
                  "Memuat data game dari API...",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }

        // 2. Kondisi Error jika request API gagal
        if (controller.errorMessage.isNotEmpty && controller.gameList.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.cloud_off_rounded,
                    color: Colors.redAccent,
                    size: 60,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    controller.errorMessage.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: woodPlank,
                      foregroundColor: lt2Gold,
                      side: const BorderSide(color: woodBorder, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    onPressed: () => controller.fetchGames(),
                    icon: const Icon(Icons.refresh),
                    label: const Text(
                      "Coba Lagi",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // 3. Tampilan ListView.builder menggunakan data dari Model (GameModel)
        return RefreshIndicator(
          color: lt2Gold,
          backgroundColor: woodPlank,
          onRefresh: () => controller.fetchGames(),
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(12),
            itemCount: controller.gameList.length,
            itemBuilder: (context, index) {
              // Mengambil objek game dari List<GameModel> di Controller
              final GameModel game = controller.gameList[index];

              return GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.detailProduk, arguments: game);
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
                      // Thumbnail Game
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
                            game.thumbnail,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.videogame_asset, color: lt2Gold, size: 40),
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: lt2Gold,
                                    strokeWidth: 2,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Informasi Data Game dari Model
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                game.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Dev: ${game.developer}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Color(0xFFA1887F),
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  // Genre Badge
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: tagBg,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: woodBorder),
                                    ),
                                    child: Text(
                                      game.genre,
                                      style: const TextStyle(
                                        color: lt2Gold,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  // Price / Free Tag
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1B5E20),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: const Color(0xFF4CAF50)),
                                    ),
                                    child: Text(
                                      game.harga,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Arrow Icon
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
      }),
    );
  }
}
