import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawfinder_app/model/user.dart';
import 'package:pawfinder_app/service/login_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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

                final data = User(
                    username: _usernameController.text,
                    password: _passwordController.text);
                final res = await SignUpService()
                    .signUp(data);
                if (res.message == "Registered Successs") {
                  print('login success');
                } else {
                  print("Registered Successs");

                }
              },
              child: const Text('SignUp'))
        ]));
  }
}
