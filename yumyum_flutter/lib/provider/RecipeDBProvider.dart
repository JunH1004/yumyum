import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RecipeDBProvider {
  late Database _database;

  // 데이터베이스 초기화
  Future<void> initDB() async {
    // 여기에 초기화 로직을 추가하세요
    String path = join(await getDatabasesPath(), 'recipe_database.db');
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // 테이블 생성 로직을 추가하세요
      await db.execute('''
        CREATE TABLE recipe (
          recipe_id INTEGER PRIMARY KEY,
          recipe_name TEXT,
          food_main TEXT,
          food_sub TEXT,
          recipe_detail TEXT,
          recipe_picture TEXT
        )
      ''');
    });
    print('Database initialized');
  }

  // 레시피 ID를 이용하여 특정 레시피 얻기
  Future<String> getRecipe(int recipeID) async {
    // 여기에 특정 레시피를 가져오는 로직을 추가하세요
    List<Map<String, dynamic>> result = await _database.query('recipe',
        columns: ['recipe_name'],
        where: 'recipe_id = ?',
        whereArgs: [recipeID],
        limit: 1);

    if (result.isNotEmpty) {
      return result[0]['recipe_name'] as String;
    } else {
      return '';
    }
  }

  // 전체 레시피 얻기
  Future<List<String>> getTotalRecipe() async {
    // 여기에 전체 레시피를 가져오는 로직을 추가하세요
    List<Map<String, dynamic>> result =
        await _database.query('recipe', columns: ['recipe_name']);

    return result.map((map) => map['recipe_name'] as String).toList();
  }
}

void main() async {
  // 예시: 클래스 인스턴스 생성 및 함수 호출
  var db = RecipeDBProvider();

  await db.initDB();

  int recipeID = 1;
  String recipe = await db.getRecipe(recipeID);
  print('Recipe for ID $recipeID: $recipe');

  List<String> allRecipes = await db.getTotalRecipe();
  print('All Recipes: $allRecipes');
}
