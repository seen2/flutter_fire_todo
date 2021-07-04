import 'package:flutter/material.dart';
import 'package:flutter_fire_todo/utils/appRoutes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: AlignmentDirectional.center,
          child: Column(
            children: [
              Image.asset(
                "assets/images/todo_login.png",
                fit: BoxFit.contain,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[700],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7))),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "Let's do it",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.login);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.login,
                                  color: Colors.blueGrey[700],
                                ),
                                Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.blueGrey[700],
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            style: ButtonStyle(
                                shadowColor:
                                    MaterialStateProperty.all(Colors.black),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                animationDuration: Duration(milliseconds: 500)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.signin);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.account_box,
                                  color: Colors.blueGrey[700],
                                ),
                                Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.blueGrey[700],
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                animationDuration: Duration(milliseconds: 500)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
