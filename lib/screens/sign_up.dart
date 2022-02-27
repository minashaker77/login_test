import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({ required this.username, required this.password});
  final String username;
  final String password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Center(
                child: Text('WelCome $username'),
              ),
              Center(
                child: Text('you\'r $password is saved'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
