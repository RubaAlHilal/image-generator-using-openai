import 'package:chatgpt_api_app/screens/getimage_upload.dart';
import 'package:chatgpt_api_app/supabase/config_supabase.dart';
import 'package:flutter/material.dart';

void main() async {
  ConfigSupabase().initializeSupabase();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SecondScreen(),
    );
  }
}
