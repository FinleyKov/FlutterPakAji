import 'package:get/get.dart';

class DetailProdukController extends GetxController {
  late dynamic produk;

  @override
  void onInit() {
    super.onInit();
    produk = Get.arguments;
  }
}
