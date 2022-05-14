import 'package:chatting_app/ui/Login/loginScreen.dart';
import 'package:chatting_app/ui/Register/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ChatApp",
      routes: {
        RegisterScreen.routeName:(BuildContext)=> RegisterScreen(),
        LogInScreen.routeName:(BuildContext)=> LogInScreen()
      },
      initialRoute: LogInScreen.routeName,
    );
  }
}
