
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConfigSupabase {
  get getSupabaseInitialize async {
    final supabaseInitialize = await Supabase.initialize(
        url: dotenv.env['url'].toString(),
        anonKey: dotenv.env['url'].toString());
  }

  SupabaseClient get getSupabase {
    final supabase = Supabase.instance.client;
    return supabase;
  }
}
