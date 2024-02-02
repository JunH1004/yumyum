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

  // 모든 영웅 가져오기
  Future<List<Map<String, dynamic>>> getAllHero() async {
    // 여기에 모든 영웅을 가져오는 로직을 추가하세요
    return await _database.query('hero');
  }

  // 영웅 추가
  Future<void> insertHero(String name, int level) async {
    // 여기에 영웅을 추가하는 로직을 추가하세요
    await _database.insert('hero', {'hero_name': name, 'hero_level': level});
    print('Hero added: Name - $name, Level - $level');
  }

  // 영웅 레벨 업
  Future<void> levelUpHero(int id) async {
    // 여기에 영웅을 레벨 업하는 로직을 추가하세요
    await _database.rawUpdate(
        'UPDATE hero SET hero_level = hero_level + 1 WHERE hero_id = ?', [id]);
    print('Hero with ID $id leveled up');
  }
}

void main() async {
  // 예시: 클래스 인스턴스 생성 및 함수 호출
  var heroDB = HeroDBProvider();

  await heroDB.initDB();

  List<Map<String, dynamic>> allHeroes = await heroDB.getAllHero();
  print('All Heroes: $allHeroes');

  await heroDB.insertHero('NewHero', 1);

  int heroID = 2;
  await heroDB.levelUpHero(heroID);
}
