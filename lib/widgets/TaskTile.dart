import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.tasks,
    required this.index,
  }) : super(key: key);

  final List<String> tasks;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      key: UniqueKey(),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: Colors.blueGrey, style: BorderStyle.solid)),
      child: ListTile(
        tileColor: Colors.white,
        leading: Text(tasks[index]),
        trailing: Checkbox(
          value: false,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
