import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDBProvider {
  late Database _database;

  // 데이터베이스 초기화
  Future<void> initDB() async {
    // 여기에 초기화 로직을 추가하세요
    String path = join(await getDatabasesPath(), 'user_database.db');
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // 테이블 생성 로직을 추가하세요
      await db.execute('''
        CREATE TABLE user (
          user_id INTEGER PRIMARY KEY,
          user_name TEXT,
          user_age INTEGER
        )
      ''');
    });
    print('Database initialized');
  }

  // 사용자 ID 얻기
  Future<int> getUserID() async {
    // 여기에 사용자 ID를 가져오는 로직을 추가하세요
    List<Map<String, dynamic>> result =
        await _database.query('user', columns: ['user_id'], limit: 1);

    if (result.isNotEmpty) {
      return result[0]['user_id'] as int;
    } else {
      return 0;
    }
  }

  // 사용자 ID 설정
  Future<void> setUserID(int userID) async {
    // 여기에 사용자 ID를 설정하는 로직을 추가하세요
    await _database.insert('user', {'user_id': userID},
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('User ID set to: $userID');
  }

  // 사용자 이름 얻기
  Future<String> getUserName() async {
    // 여기에 사용자 이름을 가져오는 로직을 추가하세요
    List<Map<String, dynamic>> result =
        await _database.query('user', columns: ['user_name'], limit: 1);

    if (result.isNotEmpty) {
      return result[0]['user_name'] as String;
    } else {
      return '';
    }
  }

  // 사용자 나이 얻기
  Future<int> getUserAge() async {
    // 여기에 사용자 나이를 가져오는 로직을 추가하세요
    List<Map<String, dynamic>> result =
        await _database.query('user', columns: ['user_age'], limit: 1);

    if (result.isNotEmpty) {
      return result[0]['age'] as int;
    } else {
      return 0;
    }
  }

  // 사용자 정보 설정 (이름, 나이)
  Future<void> setUserInfo(String name, int age) async {
    // 여기에 사용자 정보를 설정하는 로직을 추가하세요
    await _database.insert('user', {'user_name': name, 'user_age': age},
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('User info set: Name - $name, Age - $age');
  }
}

void main() async {
  // 예시: 클래스 인스턴스 생성 및 함수 호출
  var db = UserDBProvider();

  await db.initDB();

  int userID = await db.getUserID();
  print('User ID: $userID');

  await db.setUserID(456);

  String userName = await db.getUserName();
  print('User Name: $userName');

  int userAge = await db.getUserAge();
  print('User Age: $userAge');

  await db.setUserInfo('Alice', 30);
}
