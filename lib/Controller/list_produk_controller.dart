import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutirprojak/models/game_model.dart';

class ListProdukController extends GetxController {
  // Status loading indikator reaktif
  var isLoading = true.obs;

  // List data game yang di-parse dari JSON Array API
  var gameList = <GameModel>[].obs;

  // Pesan error jika gagal melakukan hit API
  var errorMessage = ''.obs;

  // Alias listProduk untuk kompatibilitas
  List<GameModel> get listProduk => gameList;

  @override
  void onInit() {
    super.onInit();
    // Hit API GET dilakukan saat controller pertama kali diinisialisasi
    fetchGames();
  }

  // Fungsi untuk melakukan HTTP GET request (hit API JSON Array)
  Future<void> fetchGames() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final Uri uri = Uri.parse('https://www.freetogame.com/api/games');
      final response = await http.get(uri).timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {
        final List<dynamic> jsonArray = json.decode(response.body);
        gameList.value = jsonArray.map((json) => GameModel.fromJson(json)).toList();
      } else {
        errorMessage.value = 'Gagal mengambil data dari server (${response.statusCode})';
      }
    } catch (e) {
      errorMessage.value = 'Terjadi kesalahan jaringan: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
