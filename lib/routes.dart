import 'package:get/get.dart';
import 'package:flutirprojak/pages/registration_page.dart';
import 'package:flutirprojak/pages/confirm_registration.dart';
import 'package:flutirprojak/pages/list_produk_page.dart';
import 'package:flutirprojak/pages/detail_produk_page.dart';
import 'package:flutirprojak/pages/main_menu_page.dart';
import 'package:flutirprojak/pages/menu_drawer_page.dart';
import 'package:flutirprojak/pages/login_clone_page.dart';

class Routes {
  static const String registration = "/registration";
  static const String confirmRegistration = "/confirmRegistration";
  static const String listProduk = "/listProduk";
  static const String detailProduk = "/detailProduk";
  static const String mainmenu = "/mainmenuPage";
  static const String menuDrawer = "/menuDrawer";
  static const String loginClone = "/loginClone";

  static final myPages = [
    GetPage(
      name: loginClone,
      page: () => LoginClonePage(),
    ),
    GetPage(
      name: registration,
      page: () => const RegistrationPage(),
    ),
    GetPage(
      name: confirmRegistration,
      page: () => const ConfirmRegistrationPage(),
    ),
    GetPage(
      name: listProduk,
      page: () => ListProdukPage(),
    ),
    GetPage(
      name: detailProduk,
      page: () => const DetailProdukPage(),
    ),
    GetPage(
      name: mainmenu,
      page: () => MainMenuPage(),
    ),
    GetPage(
      name: menuDrawer,
      page: () => const MenuDrawerPage(),
    ),
  ];
}
