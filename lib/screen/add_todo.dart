import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_todo/controller/add_todo_controller.dart';
import 'package:local_todo/controller/database_config_controller.dart';
import 'package:local_todo/screen/todo_list.dart';

class AddTodo extends StatelessWidget {
  AddTodo({Key? key}) : super(key: key);

  final DBConfigController _dbConfigCtr = Get.put(DBConfigController());
  final AddTodoController _addTodoCtr = Get.put(AddTodoController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DBConfigController>(
      builder: (controller) {
        if (controller.isLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.teal,
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text("Add Todo  "),
              actions: [
                IconButton(
                  onPressed: () {
                    Get.to(TodoList());
                  },
                  icon: Icon(
                    Icons.list_alt_outlined,
                  ),
                )
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add Todo",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: _addTodoCtr.editingControllerForTitle,
                    decoration: InputDecoration(
                      hintText: "Add title",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _addTodoCtr.editingControllerForDesc,
                    decoration: InputDecoration(
                      hintText: "Add description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      _addTodoCtr.saveTodoOnPressed();

                      FocusScopeNode currentFocus = FocusScope.of(context);
                      currentFocus.unfocus();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 55,
                        ),
                        Text(
                          "Save",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
