import 'package:flutter/material.dart';
import 'package:pawfinder_app/model/user.dart';
import 'package:pawfinder_app/service/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
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
                final res = await LoginService()
                    .login(data);
                if (res.message == "success") {
                  print(res.token);
                  print('login success');
                } else {
                  print(res.message);
                }
              },
              child: const Text('login'))
        ]));
  }
}
