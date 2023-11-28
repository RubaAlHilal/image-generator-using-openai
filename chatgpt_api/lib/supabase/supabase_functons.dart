import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFunc {
  uploudImage({required pathImageLocal}) async {
    final supabase = Supabase.instance.client;

    await supabase.storage
        .from("imageFolder")
        .upload("/users/", File(pathImageLocal));

    //
    // await supabase.storage
    //     .from("imageFolder")
    //     .upload("/users/", File(pathImageLocal));
  }
}
