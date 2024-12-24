import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseCredential {


  static SupabaseClient supabaseClient = Supabase.instance.client;

  
  static Future<void> initializeSupabase() async{
    await dotenv.load();
    final String? supabaseUrl = dotenv.env['SUPABASE_URL'];
    final String? apiKey = dotenv.env['API_KEY'];
    await Supabase.initialize(url: supabaseUrl!, anonKey: apiKey!);
  }

  
  
}