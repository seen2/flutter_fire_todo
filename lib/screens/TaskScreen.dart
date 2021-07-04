import 'package:flutter/material.dart';
import 'package:flutter_fire_todo/screens/AddTaskScreen.dart';
import 'package:flutter_fire_todo/utils/appRoutes.dart';
import 'package:flutter_fire_todo/widgets/TaskList.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final List<String> tasks = [
    "Task 1",
    "Task 2",
    "Task 3",
    "Task 4",
    "Task 5",
    "Task 6"
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 16),
          decoration: BoxDecoration(
            color: Colors.blueGrey[700],
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.menu,
                              size: 40,
                              color: Colors.blueGrey[700],
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Let's Do it",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 25),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOTAL: 3",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoutes.home,
                                (Route<dynamic> route) => false);
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.logout,
                                size: 25,
                                color: Colors.red[700],
                              ),
                              Text(
                                "Logout",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                    child: TaskList(tasks: tasks)),
              ),
            ],
          ),
        ),
        floatingActionButton: TextButton(
          child: CircleAvatar(
            backgroundColor: Colors.blueGrey[700],
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskScreen(),
            );
          },
        ),
      ),
    );
  }
}
