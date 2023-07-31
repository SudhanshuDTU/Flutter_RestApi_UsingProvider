import 'package:demoapp/DetailScreen.dart';
import 'package:demoapp/provider/Todo_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context, listen: false).getAlltodo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Api'),
        backgroundColor: Colors.indigo,
      ),
      body: Consumer<TodoProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.todos.length,
            itemBuilder: (context, index) {
              final todo = provider.todos[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => DetailScreen(
                            id: todo.id.toString(),
                            title: todo.title.toString(),
                            completed: todo.completed),
                      ));
                },
                title:
                    Text("${index} ${provider.todos[index].title.toString()}"),
              );
            },
          );
        },
      ),
    );
  }
}
