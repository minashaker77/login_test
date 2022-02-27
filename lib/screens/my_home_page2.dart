import 'package:flutter/material.dart';
import 'package:login_test/repository/app_brain.dart';
import 'package:login_test/screens/sign_up.dart';
import 'package:login_test/tools/widgets2.dart';
import 'package:validators/validators.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _formKey = GlobalKey<FormState>();
  String homeUsername = 'home username';
  String homePassword = 'home Password';
  var email;
  var password;
  TextEditingController textEditingUserController = TextEditingController();
  TextEditingController textEditingPasswController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Rectangle5.png"), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black, Colors.transparent]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 70),
                      child: Center(child: Image.asset('assets/rc_logo.png'))),
                  SizedBox(height: 200),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'hello',
                            style: TextStyle(
                                fontSize: 42,
                                color: Colors.white.withOpacity(0.8),
                                fontFamily: 'Menlo'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 30),
                          child: Text(
                            '''Lorem ipsum dolor sit amet,
                    consetetur sadipscing elitr,
                    ''',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Menlo',
                                fontSize: 12,
                                color: Colors.white),
                          ),
                        ),
                        InputBox(
                          onSaved: (value) {
                            email = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            } else if (!isEmail(value)) {
                              return 'Enter validate email';
                            } else {
                              return null;
                            }
                          },
                          hintText: 'Email',
                          obscureText: false,
                          textEditingController: textEditingUserController,
                          imageIcon: Icon(
                            Icons.person_outline,
                            size: 30,
                            color: Color(0xff00EFD6),
                          ),
                        ),
                        InputBox(
                          onSaved: (value) {
                            password = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter user password";
                            } else if (value.length < 6) {
                              return "You/'r password Must be more than 6 charters";
                            }
                          },
                          hintText: 'Password',
                          obscureText: true,
                          textEditingController: textEditingPasswController,
                          imageIcon: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Icon(
                              Icons.lock_outline,
                              color: Color(0xff00EFD6),
                              size: 25,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  _formKey.currentState!.validate();
                                  print('email : $email');
                                  print('password : $password');
                                }
                                AppBrain inputs = AppBrain(
                                    brainPassword:
                                        textEditingPasswController.text,
                                    brainUserName:
                                        textEditingUserController.text);
                                var route = MaterialPageRoute(
                                  builder: (context) {
                                    return SignUp(
                                      username: inputs.getUserName(),
                                      password: inputs.getPassword(),
                                    );
                                  },
                                );
                                Navigator.of(context).push(route);
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 10, 30),
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1.5),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Center(
                                    child: Text(
                                      'SIGN UP',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 10, 0, 30),
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color(0xff00EFD6),
                                  // border: Border.all(color: Colors.grey, width: 1.5),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Center(
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'or connect with',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Facebook',
                              style: TextStyle(
                                color: Colors.blue.shade900,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
