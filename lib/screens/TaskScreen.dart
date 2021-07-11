import 'package:firebase_auth/firebase_auth.dart';
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
                    Container(
                      height: MediaQuery.of(context).size.height / 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TaskScreenHeader(),
                          UserAvatar(),
                        ],
                      ),
                    ),
                    TaskScreenMenu(),
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

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.blueGrey[700],
                    )),
                Text(
                  FirebaseAuth.instance.currentUser!.displayName!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ));
  }
}

class TaskScreenMenu extends StatelessWidget {
  const TaskScreenMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "TOTAL: 3",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
        ),
        TextButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            await Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.home, (Route<dynamic> route) => false);
          },
          child: Column(
            children: [
              Icon(
                Icons.logout,
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
    );
  }
}

class TaskScreenHeader extends StatelessWidget {
  const TaskScreenHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25),
        ),
      ],
    );
  }
}
