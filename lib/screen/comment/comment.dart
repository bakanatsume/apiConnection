import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawfinder_app/model/comment.dart';
import 'package:pawfinder_app/service/login_service.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SignUp Page'),
        ),
        body: Column(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter valid mail id as abc@gmail.com'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your secure password'),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2MjBiYjFmYTIxZWFjMzMwMDY0MzY1OGEiLCJpYXQiOjE2NDQ5MzQ0NTB9.VAyL5jun5AZRir3M9UcvXk-ziY9OK0Hvu-9VnAB2IkI" ;
                final data = Comment(
                    comment: _usernameController.text,
                  token : token
                );
                final res = await CommentServiceWithToken()
                    .signUp(data);
                if (res.msg == "Comment added") {
                  print('Comment Added ');
                } else {
                  print("Comment Added ");

                }
              },
              child: const Text('Add Comment '))
        ]));
  }
}
