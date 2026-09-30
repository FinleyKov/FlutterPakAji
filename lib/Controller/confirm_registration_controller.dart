import 'package:get/get.dart';

class ConfirmRegistrationController extends GetxController {
  var nama = ''.obs;
  var password = ''.obs;
  var jenisKelamin = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments != null) {
      nama.value = arguments['name'] ?? '';
      password.value = arguments['password'] ?? '';
      jenisKelamin.value = arguments['jenis_kelamin'] ?? '';
    }
  }
}