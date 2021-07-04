import 'package:flutter/material.dart';
import 'package:flutter_fire_todo/widgets/TaskTile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  final List<String> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(tasks: tasks, index: index);
      },
    );
  }
}
