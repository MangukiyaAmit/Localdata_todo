import 'package:get/get.dart';

import 'database_config_controller.dart';

class TodoListController extends GetxController {
  late List<Map<String, dynamic>> todoList;
  bool isLoading = true;
  final DBConfigController _dbConfigController = Get.find<DBConfigController>();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> selectAllTodo() async {
    final db = _dbConfigController.database;
    todoList = await db.query('Todo');
    isLoading = false;
    update();
  }
}
