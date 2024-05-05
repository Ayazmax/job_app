import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:job_app/login/login_screen.dart';

import 'employer/add_job_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        '/add_jobs': (context) => AddJobScreen(),
      },
    );
  }
}
