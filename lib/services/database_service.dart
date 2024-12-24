import 'dart:math';

import 'package:employee_attendance_management/constants/constants.dart';
import 'package:employee_attendance_management/credentials/supabase_credential.dart';
import 'package:flutter/material.dart';

class DatabaseService extends ChangeNotifier{

  String generateRandomId(){
    final random = Random();
    const allChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    final randomString = List.generate(8, (index) => allChars[random.nextInt(allChars.length)]).join();
    return randomString;
  }

  Future insertNewUser(String email, var id) async {
    await SupabaseCredential.supabaseClient.from(Constants.employeeTable).insert({
      'id': id,
      'name': '',
      'email': email,
      'employee_id': generateRandomId(),
      'department': null,
    });
  }

}