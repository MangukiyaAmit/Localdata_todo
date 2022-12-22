import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_todo/controller/todo_list_controller.dart';

class TodoList extends StatelessWidget {
  TodoList({Key? key}) : super(key: key);

  final TodoListController _todoListCtr = Get.put(TodoListController());

  @override
  Widget build(BuildContext context) {
    _todoListCtr.selectAllTodo();

    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: GetBuilder<TodoListController>(
        builder: (controller) {
          if (controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.teal,
              ),
            );
          } else {
            return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Center(
                        child: Text("${_todoListCtr.todoList[index]['id']}"),
                      ),
                    ),
                    title: Text(
                      "${_todoListCtr.todoList[index]['title']}",
                    ),
                    subtitle: Text(
                      "${_todoListCtr.todoList[index]['description']}",
                    ),
                  );
                },
                itemCount: _todoListCtr.todoList.length);
          }
        },
      ),
    );
  }
}
