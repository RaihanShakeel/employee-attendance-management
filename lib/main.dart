import 'package:employee_attendance_management/credentials/supabase_credential.dart';
import 'package:employee_attendance_management/routes/app_routes.dart';
import 'package:employee_attendance_management/services/auth_service.dart';
import 'package:employee_attendance_management/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseCredential.initializeSupabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (context) => DatabaseService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Employee Attendance Management',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: AppRoute.routes,
        initialRoute: AppRoute.mainPageRoute,
      ),
    );
  }
}
