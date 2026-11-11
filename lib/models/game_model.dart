class GameModel {
  final int id;
  final String title;
  final String thumbnail;
  final String shortDescription;
  final String gameUrl;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String releaseDate;
  final String freetogameProfileUrl;

  GameModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freetogameProfileUrl,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? '0') ?? 0,
      title: json['title']?.toString() ?? '',
      thumbnail: json['thumbnail']?.toString() ?? '',
      shortDescription: json['short_description']?.toString() ?? '',
      gameUrl: json['game_url']?.toString() ?? '',
      genre: json['genre']?.toString() ?? 'Game',
      platform: json['platform']?.toString() ?? 'PC',
      publisher: json['publisher']?.toString() ?? '',
      developer: json['developer']?.toString() ?? 'Unknown Developer',
      releaseDate: json['release_date']?.toString() ?? '',
      freetogameProfileUrl: json['freetogame_profile_url']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'short_description': shortDescription,
      'game_url': gameUrl,
      'genre': genre,
      'platform': platform,
      'publisher': publisher,
      'developer': developer,
      'release_date': releaseDate,
      'freetogame_profile_url': freetogameProfileUrl,
    };
  }

  // Helper getters untuk tampilan UI Lumber Tycoon 2 / Game Store
  String get namaProduk => title;
  String get imagePath => thumbnail;
  String get deskripsi => shortDescription;
  String get harga => "FREE";
  String get rating => "4.8 ★ ($genre)";
}
