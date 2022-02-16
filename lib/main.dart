import 'package:flutter/material.dart';
import 'package:pawfinder_app/screen/comment/comment.dart';
import 'package:pawfinder_app/screen/signup/signup.dart';

import 'screen/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CommentScreen(),
    );
  }
}
