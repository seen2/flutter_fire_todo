import 'package:flutter/material.dart';
import 'package:flutter_fire_todo/utils/appRoutes.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  _AddTaskScreemState createState() => _AddTaskScreemState();
}

class _AddTaskScreemState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                child: Text(
                  "Add Task",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Task Name *',
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.tasks);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.black),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueGrey[700]),
                    animationDuration: Duration(milliseconds: 500)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
