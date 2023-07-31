import 'package:demoapp/models/Todo_model.dart';
import 'package:demoapp/services/api.dart';
import 'package:flutter/material.dart';

class TodoProvider with ChangeNotifier {
  List<TodoList> _todos = [];
  List<TodoList> get todos => _todos;

  bool isLoading = false;

  Future<void> getAlltodo() async {
    isLoading = true;
    notifyListeners();

    var res = await Api().fetchAllTodo();
    _todos = res;
    isLoading = false;
    notifyListeners();
  }
}
