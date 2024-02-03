import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HeroDBProvider {
  late Database _database;

  // 데이터베이스 초기화
  Future<void> initDB() async {
    // 여기에 초기화 로직을 추가하세요
    String path = join(await getDatabasesPath(), 'hero_database.db');
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // 테이블 생성 로직을 추가하세요
      await db.execute('''
        CREATE TABLE hero (
          hero_id INTEGER PRIMARY KEY,
          hero_name TEXT,
          hero_level INTEGER,
          hero_damage INTEGER
        )
      ''');
    });
    print('Hero Database initialized');
  }

// 특정 영웅 가져오기
  Future<Map<String, dynamic>> getHeroById(int heroID) async {
    // 여기에 특정 영웅을 가져오는 로직을 추가하세요
    List<Map<String, dynamic>> result = await _database.query(
      'hero',
      where: 'hero_id = ?', // hero_id에 해당하는 조건 추가
      whereArgs: [heroID], // hero_id 값을 전달
      limit: 1,
    );

    if (result.isNotEmpty) {
      return result[0];
    } else {
      return {}; // 혹은 null을 반환하거나 적절한 예외를 던질 수 있습니다.
    }
  }

  // 영웅 추가
  Future<void> insertHero(
      int heroID, String heroName, int heroLevel, int heroDamage) async {
    // 여기에 영웅을 추가하는 로직을 추가하세요
    await _database.insert('hero', {
      'hero_id': heroID,
      'hero_name': heroName,
      'hero_level': heroLevel,
      'hero_damage': heroDamage
    });
    print(
        'Hero added: ID - $heroID Name - $heroName, Level - $heroLevel, Damage - $heroDamage');
  }

  // 영웅 레벨 업
  Future<void> levelUpHero(int heroId) async {
    // 여기에 영웅을 레벨 업하는 로직을 추가하세요
    await _database.rawUpdate(
        'UPDATE hero SET hero_level = hero_level + 1 WHERE hero_id = ?',
        [heroId]);
    print('Hero with ID $heroId leveled up');
  }
}

// 레벨 업에 따른 damage 증가 sql // 또는 unity에서 받아오기

void main() async {
  // 예시: 클래스 인스턴스 생성 및 함수 호기
  var heroDB = HeroDBProvider();

  await heroDB.initDB();

  Map<String, dynamic> allHeroes = await heroDB.getHeroById(1);
  print('All Heroes: $allHeroes');

  await heroDB.insertHero(1, 'warrior', 1, 1);

  int heroID = 1;
  await heroDB.levelUpHero(heroID);
}
