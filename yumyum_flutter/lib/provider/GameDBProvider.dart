import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class GameDBProvider {
  late Database _database;

  // 데이터베이스 초기화
  Future<void> initDB() async {
    // 여기에 초기화 로직을 추가하세요
    String path = join(await getDatabasesPath(), 'game_database.db');
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // 테이블 생성 로직을 추가하세요
      await db.execute('''
        CREATE TABLE hero (
          user_id INTEGER PRIMARY KEY,
          hero_id INTEGER
        )
      ''');
    });
    print('Game Database initialized');
  }

  // 특정 영웅의 ID 가져오기
  Future<int> getHeroID(int userID) async {
    // 여기에 특정 사용자의 영웅 ID를 가져오는 로직을 추가하세요
    List<Map<String, dynamic>> result = await _database.query('hero',
        columns: ['hero_id'],
        where: 'user_id = ?',
        whereArgs: [userID],
        limit: 1);

    if (result.isNotEmpty) {
      return result[0]['hero_id'] as int;
    } else {
      return 0;
    }
  }
}

void main() async {
  // 예시: 클래스 인스턴스 생성 및 함수 호출
  var gameDBProvider = GameDBProvider();

  await gameDBProvider.initDB();

  int userID = 123; // 사용자의 ID를 적절한 값으로 설정하세요
  int heroID = await gameDBProvider.getHeroID(userID);
  print('Hero ID for User ID $userID: $heroID');
}
