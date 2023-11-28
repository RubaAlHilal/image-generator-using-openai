import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ConfigSupabase {
  initializeSupabase() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Supabase.initialize(
      url: "https://zkidhsvhkjshockssdec.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpraWRoc3Zoa2pzaG9ja3NzZGVjIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5OTc3NzIxNCwiZXhwIjoyMDE1MzUzMjE0fQ.ogA1CDmr1lRh5m5z50y-PDSVmWxtzPfeFCXMvoj7ofg",
    );
  }
}
