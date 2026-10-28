import 'package:get/get.dart';
import 'package:flutirprojak/models/produk_model.dart';

class ListProdukController extends GetxController {
  List<ProdukModel> listProduk = [
    ProdukModel(
      namaProduk: "Many Axe",
      harga: "\$38,000",
      imagePath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNtFftXp-BhVzWWFBZ4MK06tGS4_TECR28zMTmEctyUA&s=10",
      developer: "Fancy Furnishings",
      rating: "5.0 ★ (Legendary)",
      deskripsi: "Kapak langka dengan struktur blade unik. Memiliki damage sangat besar dan jangkauan tebasan luas di kelasnya.",
    ),
    ProdukModel(
      namaProduk: "End Times Axe",
      harga: "\$10,000",
      imagePath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHP6-IpVUAdrUKZ6U9av4bwfJsAN4-XxutLv1WhTG_bg&s",
      developer: "The Den (Bridge Base)",
      rating: "4.9 ★ (Mythical)",
      deskripsi: "Kapak legendaris yang memicu efek ledakan fisik saat menembus Phantom Wood di area rahasia.",
    ),
    ProdukModel(
      namaProduk: "Candy Corn Axe",
      harga: "\$10,000",
      imagePath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeFtoBgQi9mjweMhuv_o24UksM7ResiezDHqx1V2J7Xw&s",
      developer: "Spooky Shop (Event)",
      rating: "4.5 ★ (Limited Event)",
      deskripsi: "Kapak edisi khusus Spooky Event dengan daya tebas tinggi pada pohon-pohon khusus bernuansa mistis.",
    ),
    ProdukModel(
      namaProduk: "Gingerbread Axe",
      harga: "\$65,000",
      imagePath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrHsT1SHt7bvKb5knvXw3Y_4eNQTzH3UMxA2x4lwbgDA&s",
      developer: "Bob's Shack (Christmas)",
      rating: "4.8 ★ (Rare Event)",
      deskripsi: "Sangat ampuh dan cepat ketika digunakan untuk memotong kayu Koa & Walnut di daratan tinggi.",
    ),
    ProdukModel(
      namaProduk: "Blue Steel Axe",
      harga: "\$18,300",
      imagePath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5sKyEowdtYYNyayTSjSK0sgJ1ylYGKiXeo4g8m1OE6Q&s=10",
      developer: "Woodman Store",
      rating: "4.6 ★ (Specialty)",
      deskripsi: "Kapak khusus berbahan Baja Biru dengan multiplier damage berlipat ganda untuk pohon Blue Spruce.",
    ),
    ProdukModel(
      namaProduk: "Haunted Hatchet",
      harga: "\$16,600",
      imagePath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwj7DoqOLw3bJ51732ER1CgDEpwzOvIof7xTvSqTeuPQ&s",
      developer: "Spooky Shop",
      rating: "4.4 ★ (Spooky Event)",
      deskripsi: "Efisien untuk memotong Spooky Wood & Sinister Wood dengan aura bayangan gelap saat diayunkan.",
    ),
    ProdukModel(
      namaProduk: "Frost Axe",
      harga: "\$13,500",
      imagePath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrgthGnx7yBZ2_vNuCdVHC4beztH_1iOFukjNJqwdQ6A&s",
      developer: "Chilly Gift Shop",
      rating: "4.7 ★ (Winter Event)",
      deskripsi: "Memberikan damage maksimal ketika digunakan untuk menebang kayu di wilayah salju (Frost Wood).",
    ),
    ProdukModel(
      namaProduk: "Fire Axe",
      harga: "\$10,000",
      imagePath: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8hUKpH1qo6A8nIJ0u8eOBkNrkCK262XsHIWDcdakRhQ&s=10",
      developer: "Volcano Merchant",
      rating: "4.8 ★ (Volcano Area)",
      deskripsi: "Kapak tahan panas tercepat untuk menebang dan memotong Lava Wood di area gunung berapi.",
    ),
  ];
}