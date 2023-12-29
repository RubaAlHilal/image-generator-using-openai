import 'dart:io';
import 'package:chatgpt_api_app/supabase/config_supabase.dart';

class SupabaseFunc {
  uploudImage({required pathImageLocal}) async {
    final supa = ConfigSupabase().getSupabase;

    await supa.storage
        .from("imageFolder")
        .upload("/users/", File(pathImageLocal));
  }
}
