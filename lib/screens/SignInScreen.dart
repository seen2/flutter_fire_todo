import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_todo/utils/appRoutes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  String? name = "",
      email = "",
      password = "",
      confirmPassword = "",
      error = "";
  bool loading = false;

  onSignin() async {
    setState(() {
      loading = true;
    });
    try {
      if (_formKey.currentState!.validate()) {
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Processing Data')));
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!);
        FirebaseAuth auth = FirebaseAuth.instance;
        await auth.currentUser!.updateDisplayName(name);
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email!, password: password!);
        await Navigator.pushNamed(context, AppRoutes.tasks);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = e.message;
      });
    } catch (e) {
      setState(() {
        error = "Something Went Wrong";
      });
    } finally {
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
        title: Text("SIGNUP"),
      ),
      body: Material(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    error!,
                    style: TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Name";
                      }
                    },
                    onChanged: (value) => {
                      setState(() {
                        name = value;
                      })
                    },
                    decoration: InputDecoration(
                      labelText: 'Name *',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Email";
                      }
                    },
                    onChanged: (value) => {
                      setState(() {
                        email = value;
                      })
                    },
                    decoration: InputDecoration(
                      labelText: 'Email *',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Password";
                      }
                    },
                    onChanged: (value) => {
                      setState(() {
                        password = value;
                      })
                    },
                    decoration: InputDecoration(
                      labelText: 'Password *',
                    ),
                    obscureText: true,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Confirm Password";
                      } else if (value != password) {
                        return "Please Match the passwords";
                      }
                    },
                    onChanged: (value) => {
                      setState(() {
                        confirmPassword = value;
                      })
                    },
                    decoration: InputDecoration(
                      labelText: 'Confirm Password *',
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
                            onSignin();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.account_box,
                                color: Colors.white,
                              ),
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.blueGrey[700]),
                              animationDuration: Duration(milliseconds: 500)),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
