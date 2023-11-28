import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<String> saveImage(
    {required String url, required String imageName}) async {
  try {
    final urlImage = Uri.parse(url);

    final response = await http.get(urlImage);
    final directoryPath = await getApplicationCacheDirectory();

    final File imageFile = File("${directoryPath.path}/$imageName.png");
    await imageFile.writeAsBytes(response.bodyBytes);
    return imageFile.path;
  } catch (e) {
    throw FormatException(e.toString());
  }
}
