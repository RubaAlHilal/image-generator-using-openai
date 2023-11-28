import 'package:chatgpt_api_app/supabase/config_supabase.dart';
import 'package:chatgpt_api_app/utils/save_image.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() async {
  ConfigSupabase().initializeSupabase();

  // final pathImage = saveImage(url: '', imageName: '');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
