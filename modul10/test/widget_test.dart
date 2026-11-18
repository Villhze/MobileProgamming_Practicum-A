import 'package:flutter_test/flutter_test.dart';
import 'package:game_app/model/game.dart';
import 'package:game_app/model/detailgame.dart';

void main() {
  group('JSON Serialization & Deserialization Tests', () {
    test('Game.fromJson parses valid JSON correctly', () {
      final json = {
        'id': 1,
        'title': 'Overwatch 2',
        'thumbnail': 'https://www.freetogame.com/g/540/thumbnail.jpg',
        'short_description': 'A hero shooter game',
        'game_url': 'https://www.freetogame.com/open/overwatch-2',
        'genre': 'Shooter',
        'platform': 'PC (Windows)',
        'publisher': 'Blizzard Entertainment',
        'developer': 'Blizzard Entertainment',
        'release_date': '2022-10-04',
        'freetogame_profile_url': 'https://www.freetogame.com/overwatch-2',
      };

      final game = Game.fromJson(json);

      expect(game.id, 1);
      expect(game.title, 'Overwatch 2');
      expect(game.genre, 'Shooter');
      expect(game.shortDescription, 'A hero shooter game');
    });

    test('DetailGame.fromJson parses valid JSON with nested models', () {
      final json = {
        'id': 452,
        'title': 'Call of Duty: Warzone',
        'thumbnail': 'https://www.freetogame.com/g/452/thumbnail.jpg',
        'status': 'Live',
        'short_description': 'A standalone battle royale game',
        'description': 'Call of Duty: Warzone is a free-to-play battle royale...',
        'game_url': 'https://www.freetogame.com/open/call-of-duty-warzone',
        'genre': 'Shooter',
        'platform': 'Windows',
        'publisher': 'Activision',
        'developer': 'Infinity Ward',
        'release_date': '2020-03-10',
        'freetogame_profile_url': 'https://www.freetogame.com/call-of-duty-warzone',
        'minimum_system_requirements': {
          'os': 'Windows 10',
          'processor': 'Intel Core i3-4340',
          'memory': '8GB RAM',
          'graphics': 'NVIDIA GeForce GTX 670',
          'storage': '175GB HD space'
        },
        'screenshots': [
          {'id': 1, 'image': 'https://www.freetogame.com/g/452/screenshot-1.jpg'},
          {'id': 2, 'image': 'https://www.freetogame.com/g/452/screenshot-2.jpg'},
          {'id': 3, 'image': 'https://www.freetogame.com/g/452/screenshot-3.jpg'}
        ]
      };

      final detail = DetailGame.fromJson(json);

      expect(detail.id, 452);
      expect(detail.title, 'Call of Duty: Warzone');
      expect(detail.minimum_system_requirements.os, 'Windows 10');
      expect(detail.screenshots.length, 3);
      expect(detail.screenshots[0].id, 1);
    });
  });
}
