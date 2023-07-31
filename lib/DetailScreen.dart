import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  final String title;
  final bool? completed;

  const DetailScreen(
      {super.key,
      required this.id,
      required this.title,
      required this.completed});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Todo'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Text("TODO ID : ${widget.id}"),
          Text("TITLE : ${widget.title}"),
          Text("STATUS : ${widget.completed}")
        ],
      ),
    );
  }
}
