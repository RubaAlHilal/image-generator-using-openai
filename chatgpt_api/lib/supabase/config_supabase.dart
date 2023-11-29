import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ConfigSupabase {
  initializeSupabase() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Supabase.initialize(
      url: "https://zkidhsvhkjshockssdec.supabase.co",
      anonKey: "key from supabase",
    );
  }
}
