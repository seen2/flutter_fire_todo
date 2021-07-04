import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_fire_todo/screens/HomeScreens.dart';
import 'package:flutter_fire_todo/screens/LoginScreen.dart';
import 'package:flutter_fire_todo/screens/SignInScreen.dart';
import 'package:flutter_fire_todo/screens/TaskScreen.dart';
import 'package:flutter_fire_todo/utils/appRoutes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        
          appBarTheme: AppBarTheme(
        backgroundColor: Colors.blueGrey[700],
      )),
      home: Material(child: HomeScreen()),
      routes: {
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.signin: (context) => SignInScreen(),
        AppRoutes.tasks: (context) => TaskScreen(),
      },
    );
  }
}
