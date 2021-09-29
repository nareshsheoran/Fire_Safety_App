import 'dart:convert';

import 'package:fire_safety/auth/model/sign_up_request.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  const SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool showPassword = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/Background.jpg'),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Create account',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Sign in to continue',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 28),
                TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      errorStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(fontSize: 22, color: Colors.white38),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Input Name";
                      }
                    }),
                SizedBox(
                  height: 28,
                ),
                TextFormField(
                  controller: mailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.white),
                    hintText: 'Mobile no./Email',
                    hintStyle: TextStyle(fontSize: 22, color: Colors.white38),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  // ignore: missing_return
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Input Mobile";
                    }
                    if (value.length != 10) {
                      return 'Please input 10 digit mobile no';
                    }
                  },
                ),
                SizedBox(
                  height: 28,
                ),
                TextFormField(
                    obscureText: showPassword,
                    controller: passwordController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () =>
                            setState(() => showPassword = !showPassword),
                        color: Colors.white,
                      ),
                      hintText: 'Password',
                      errorStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(fontSize: 22, color: Colors.white38),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Input Password";
                      }
                      if (value.length < 6) {
                        return 'Password must be 7 digit';
                      }
                    }),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: OutlinedButton(
                        onPressed: () async {
                          await signUp();
                          if (_formKey.currentState.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 8),
                          child: Text(
                            'Sign up',
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
      ),
    );
  }

  Future signUp() async {
    String name = nameController.text;
    String mob = mailController.text;
    String password = passwordController.text;

    if (name.isEmpty) {
      Fluttertoast.showToast(msg: "Please input name");
      return;
    }
    if (mob.isEmpty) {
      Fluttertoast.showToast(msg: "Please input mobile");
      return;
    }
    if (password.isEmpty) {
      Fluttertoast.showToast(msg: "Please input password");
      return;
    }

    SignUpRequest request = SignUpRequest(
        name: name, mobile: mob, password: password, otp: "123456");

    var url = Uri.parse(
        'https://firesafetyhanumangarh.in/RestApi/user_api/student_register');
    var response = await http.post(url, body: request.toJson());
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map<String, dynamic> map =
    jsonDecode(response.body) as Map<String, dynamic>;
    if (map != null && map['message'] != null) {
      Fluttertoast.showToast(msg: map['message']);

      if (response.statusCode == 200 &&
          map['message'] == "Registered Successfully") {
        Navigator.pop(context);
      }
    }
  }
}
