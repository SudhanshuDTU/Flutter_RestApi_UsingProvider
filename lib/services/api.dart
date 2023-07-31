import 'dart:convert';

import 'package:demoapp/models/Todo_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Api {
  Future<List<TodoList>> fetchAllTodo() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/');
    Response response = await http.get(url);
    final json = jsonDecode(response.body) as List;
    final todos = json.map((e) => TodoList.fromJson(e)).toList();
    return todos;
  }
}
