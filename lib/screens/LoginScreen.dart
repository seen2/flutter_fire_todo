import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_todo/utils/appRoutes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "", password = "", error = '';
  bool loading = false;

  final _formKey = GlobalKey<FormState>();

  Future<String?> onLogin() async {
    setState(() {
      loading = true;
    });
    try {
      await Navigator.pushNamed(context, AppRoutes.tasks);
      return "User Signin Success";
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = e.message!;
      });
    } finally {
      // Validate returns true if the form is valid, or false otherwise.
      if (_formKey.currentState!.validate()) {
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Processing Data')));
      }
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("LOGIN"),
      ),
      body: Material(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter email";
                    } else if (error.length > 0) {
                      return error;
                    } else {
                      return "Something went Wrong";
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Email *',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter password";
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Password *',
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                loading
                    ? CircularProgressIndicator(
                        color: Colors.blueGrey[700],
                      )
                    : TextButton(
                        onPressed: () {
                          onLogin();

                          // if (error!.isEmpty)
                          //   Navigator.pushNamed(context, AppRoutes.tasks);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.login,
                              color: Colors.white,
                            ),
                            Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
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
                                MaterialStateProperty.all(Colors.blueGrey[700]),
                            animationDuration: Duration(milliseconds: 500)),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
