import 'package:fire_safety/auth/page/login_page.dart';
import 'package:fire_safety/shared/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      initialRoute: Routes.LOGIN_PAGE,
      routes: routes,
    );
  }
}
