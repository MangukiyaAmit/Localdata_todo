import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBConfigController extends GetxController {
  late Database database;
  bool isLoading = true;

  @override
  void onInit() {
    configDatabase().then((value) {
      isLoading = false;
      update();
    });

    super.onInit();
  }

  Future<void> configDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE Todo(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT)',
        );
      },
      version: 1,
    );
  }
}
