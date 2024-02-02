import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RecordDBProvider {
  late Database _database;

  // 데이터베이스 초기화
  Future<void> initDB() async {
    // 여기에 초기화 로직을 추가하세요
    String path = join(await getDatabasesPath(), 'record_database.db');
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // 테이블 생성 로직을 추가하세요
      await db.execute('''
        CREATE TABLE record (
          id INTEGER PRIMARY KEY,
          date TEXT,
          picture TEXT
        )
      ''');
    });
    print('Record Database initialized');
  }

  // 기록 추가
  Future<void> insertRecord(String date, String picture) async {
    // 여기에 기록을 추가하는 로직을 추가하세요
    await _database.insert('record', {'date': date, 'picture': picture});
    print('Record added: Date - $date, Picture - $picture');
  }

  // 모든 기록 가져오기
  Future<List<Map<String, dynamic>>> getAllRecord() async {
    // 여기에 모든 기록을 가져오는 로직을 추가하세요
    return await _database.query('record');
  }
}

void main() async {
  // 예시: 클래스 인스턴스 생성 및 함수 호출
  var recordDBProvider = RecordDBProvider();

  await recordDBProvider.initDB();

  String currentDate = '2022-02-15';
  String pictureURL = 'url3';
  await recordDBProvider.insertRecord(currentDate, pictureURL);

  List<Map<String, dynamic>> allRecords = await recordDBProvider.getAllRecord();
  print('All Records: $allRecords');
}
