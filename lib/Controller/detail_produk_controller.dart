import 'package:get/get.dart';
import 'package:flutirprojak/models/produk_model.dart';

class DetailProdukController extends GetxController {
  late ProdukModel produk;

  @override
  void onInit() {
    super.onInit();
    produk = Get.arguments as ProdukModel;
  }
}