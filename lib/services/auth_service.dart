import 'package:employee_attendance_management/credentials/supabase_credential.dart';
import 'package:employee_attendance_management/routes/app_routes.dart';
import 'package:employee_attendance_management/services/database_service.dart';
import 'package:employee_attendance_management/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends ChangeNotifier {
  final _client = SupabaseCredential.supabaseClient;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  User? currentUser;

  DatabaseService dbService = DatabaseService();

  

  set setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> registerUser({
    required String username,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      setIsLoading = true;
      final AuthResponse response =
          await _client.auth.signUp(
        email: email,
        password: password,
        data: {
          'username': username,
        },
      );

      if (response.user != null) {
        currentUser = _client.auth.currentUser;
        if (currentUser != null){
          dbService.insertNewUser(email, currentUser!.id);
          await loginUser(email: email, password: password, context: context);
          Utils.showSnackBar('You successful Registered and logged in', context);
          Navigator.pushNamed(context, AppRoute.mainPageRoute);
        }
      }
    } catch (e) {
      Utils.showSnackBar(e.toString(), context);
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      setIsLoading = true;
      final AuthResponse response = await SupabaseCredential.supabaseClient.auth
          .signInWithPassword(email: email, password: password);

        if (response.user != null) {
          Utils.showSnackBar("Login successful, welcome back!", context);
          setIsLoading = false;
        }
    } catch (e) {
      Utils.showSnackBar(e.toString(), context);
    }
  }

  Future<void> logoutUser() async{
    await SupabaseCredential.supabaseClient.auth.signOut();
    notifyListeners();
  }
}
