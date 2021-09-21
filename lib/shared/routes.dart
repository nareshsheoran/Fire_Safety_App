import 'package:fire_safety/home/page/home_page.dart';
import 'package:fire_safety/home/page/reset_password.dart';

import '../auth/page/login_page.dart';
import '../auth/page/signup_page.dart';
import '../auth/page/splash_page.dart';

class Routes {
  static const String LOGIN_PAGE = '/loginpage';
  static const String SPLASH_PAGE = '/logindashboard';
  static const String SIGNUP_PAGE = '/signuppage';
  static const String HOME_PAGE = '/homepage';
  static const String RESETPASSWORD_PAGE = '/resetpasswordpage';
}

final routes = {
  Routes.LOGIN_PAGE: (context) => LoginPage(),
  Routes.SPLASH_PAGE: (context) => SplashPage(),
  Routes.SIGNUP_PAGE: (context) => SignupPage(),
  Routes.HOME_PAGE: (context) => HomePage(),
  Routes.RESETPASSWORD_PAGE: (context) => ResetPassword(),
};
