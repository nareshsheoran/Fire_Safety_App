import 'dart:convert';

import 'package:fire_safety/auth/model/login_request.dart';
import 'package:fire_safety/shared/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assests/image/Background.jpg'),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Welcome,',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'MyriadPro'),
              ),
              SizedBox(height: 4),
              Text(
                'Sign in to continue',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: mailController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Mobile no./Email',
                  hintStyle: TextStyle(fontSize: 22, color: Colors.white38),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                controller: passwordController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 22, color: Colors.white38),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.RESETPASSWORD_PAGE);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: OutlinedButton(
                      onPressed: () {
                        login(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MyriadPro',
                              fontSize: 18),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white, width: 1.2),
                      ),
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

  Future login(BuildContext context) async {
    String mobile = mailController.text;
    String password = passwordController.text;

    if (mobile.isEmpty) {
      Fluttertoast.showToast(msg: "Please input mobile");
      return;
    }
    if (password.isEmpty) {
      Fluttertoast.showToast(msg: "Please input password");
      return;
    }

    LoginRequest request = LoginRequest(mobile: mobile, password: password);

    var url = Uri.parse(
        'https://firesafetyhanumangarh.in/RestApi/user_api/student_login');
    var response = await http.post(url, body: request.toJson());
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    Map<String, dynamic> map =
        jsonDecode(response.body) as Map<String, dynamic>;

    if (map != null && map['message'] != null) {
      Fluttertoast.showToast(msg: map['message']);
      if (response.statusCode == 200 &&
          map['message'] == "Login Successfully") {
        Navigator.pushNamed(context, Routes.HOME_PAGE);
      }
    }
  }
}
