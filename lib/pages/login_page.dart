import 'package:employee_attendance_management/routes/app_routes.dart';
import 'package:employee_attendance_management/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  double? _screenHeight, _screenWidth;
  String? _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _logo(),
              SizedBox(
                height: _screenHeight! * 0.01,
              ),
              _loginpage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return SafeArea(
      child: Container(
        height: _screenHeight! * 0.30,
        width: _screenWidth,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(70)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.qr_code_scanner,
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            const Text(
              'Employee Attendance Management',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginpage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _welcomeText(),
        loginForm(),
        _loginButton(),
        _registerPageButton(),
      ],
    );
  }

  Widget _welcomeText() {
    return Text(
      'Welcome Back, please login',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    );
  }

  Widget loginForm() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _screenWidth! * 0.05),
      height: _screenHeight! * 0.2,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value) {
                _email = value.trim();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This field is required';
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                label: Text('Email Address'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            TextFormField(
              onChanged: (value) {
                _password = value.trim();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This field is required';
                } else {
                  return null;
                }
              },
              obscureText: true,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                label: Text('Password'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Consumer<AuthService>(
      builder: (context, AuthService authService, child) {
        return SizedBox(
          width: _screenWidth! * 0.9,
          child: authService.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      authService.loginUser(
                        email: _email!,
                        password: _password!,
                        context: context,
                      );
                      Navigator.pushNamed(context, AppRoute.mainPageRoute);
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
        );
      },
    );
  }

  Widget _registerPageButton() {
    return SizedBox(
      height: _screenHeight! * 0.05,
      child: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoute.registerPageRoute);
          },
          child: Text(
            "don't have an account?",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
