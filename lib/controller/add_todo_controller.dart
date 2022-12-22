import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_todo/controller/database_config_controller.dart';
import 'package:sqflite/sqflite.dart';

class AddTodoController extends GetxController {
  TextEditingController _editingControllerForTitle = TextEditingController();

  TextEditingController get editingControllerForTitle =>
      _editingControllerForTitle;

  TextEditingController _editingControllerForDesc = TextEditingController();

  TextEditingController get editingControllerForDesc =>
      _editingControllerForDesc;

  final DBConfigController _dbConfigController = Get.find<DBConfigController>();

  @override
  void onInit() {
    super.onInit();
  }

  void saveTodoOnPressed() {
    final db = _dbConfigController.database;

    Map<String, dynamic> data = {
      "title": _editingControllerForTitle.text,
      "description": _editingControllerForDesc.text
    };

    db.insert(
      'Todo',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _editingControllerForTitle.clear();
    _editingControllerForDesc.clear();
  }
}
