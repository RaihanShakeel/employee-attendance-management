import 'package:employee_attendance_management/pages/login_page.dart';
import 'package:employee_attendance_management/pages/attendance_page.dart';
import 'package:employee_attendance_management/pages/register_page.dart';
import 'package:flutter/material.dart';

class AppRoute{
  static String loginPageRoute = 'login';
  static String registerPageRoute = 'register';
  static String mainPageRoute = '/';

  static Map<String, WidgetBuilder> routes = {
    loginPageRoute: (BuildContext context) => LoginPage(),
    registerPageRoute: (BuildContext context) => RegisterPage(),
    mainPageRoute: (BuildContext context) => AttendancePage(),
  };
}