import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RecordSavedDBProvider {
  late Database _database;

  // 데이터베이스 초기화
  Future<void> initDB() async {
    // 여기에 초기화 로직을 추가하세요
    String path = join(await getDatabasesPath(), 'saved_record_database.db');
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // 테이블 생성 로직을 추가하세요
      await db.execute('''
        CREATE TABLE saved_record (
          user_id INTEGER PRIMARY KEY,
          recipe_id INTEGER
        )
      ''');
    });
    print('Saved Record Database initialized');
  }

  // 저장된 기록 추가
  Future<void> insertSavedRecord(int userID, int recipeID) async {
    // 여기에 저장된 기록을 추가하는 로직을 추가하세요
    await _database
        .insert('saved_record', {'user_id': userID, 'recipe_id': recipeID});
    print('Saved Record added: User ID - $userID, Recipe ID - $recipeID');
  }

  // 저장된 기록 삭제
  Future<void> deleteSavedRecord(int recipeID) async {
    // 여기에 저장된 기록을 삭제하는 로직을 추가하세요
    await _database
        .delete('saved_record', where: 'recipe_id = ?', whereArgs: [recipeID]);
    print('Saved Record with ID $recipeID deleted');
  }
}

void main() async {
  // 예시: 클래스 인스턴스 생성 및 함수 호출
  var recordSavedDBProvider = RecordSavedDBProvider();

  await recordSavedDBProvider.initDB();

  int userID = 1;
  int recipeID = 10;

  // 저장된 기록 추가
  await recordSavedDBProvider.insertSavedRecord(userID, recipeID);

  // 삭제할 저장된 기록의 ID
  int savedRecordID = 1;

  // 저장된 기록 삭제
  await recordSavedDBProvider.deleteSavedRecord(savedRecordID);
}
