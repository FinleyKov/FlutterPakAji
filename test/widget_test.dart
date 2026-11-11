import 'package:flutter_test/flutter_test.dart';
import 'package:flutirprojak/models/game_model.dart';

void main() {
  test('GameModel parses json correctly', () {
    final Map<String, dynamic> sampleJson = {
      "id": 540,
      "title": "Overwatch",
      "thumbnail": "https://www.freetogame.com/g/540/thumbnail.jpg",
      "short_description": "A hero-focused shooter",
      "game_url": "https://www.freetogame.com/open/overwatch",
      "genre": "Shooter",
      "platform": "PC (Windows)",
      "publisher": "Activision Blizzard",
      "developer": "Blizzard Entertainment",
      "release_date": "2022-10-04",
      "freetogame_profile_url": "https://www.freetogame.com/overwatch"
    };

    final game = GameModel.fromJson(sampleJson);
    expect(game.id, 540);
    expect(game.title, "Overwatch");
    expect(game.genre, "Shooter");
    expect(game.developer, "Blizzard Entertainment");
    expect(game.harga, "FREE");
  });
}
