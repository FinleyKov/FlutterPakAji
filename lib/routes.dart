import 'package:get/get.dart';
import 'package:flutirprojak/pages/registration_page.dart';
import 'package:flutirprojak/pages/confirm_registration.dart';

class Routes {
  static const String registration = "/registration";
  static const String confirmRegistration = "/confirmRegistration";

  static final myPages = [
    GetPage(
      name: registration, 
      page: () => const RegistrationPage(),
    ),
    GetPage(
      name: confirmRegistration, 
      page: () => const ConfirmRegistrationPage(),
    ),
  ];
}