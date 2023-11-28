import 'dart:convert';

import 'package:chatgpt_api_app/supabase/supabase_functons.dart';
import 'package:http/http.dart' as http;
import 'package:chatgpt_api_app/utils/save_image.dart';

class ApiNetworking {
  final key = "Bearer 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";
  final url = "https://api.openai.com/v1/chat/completions";
  final imageUrl = "https://api.openai.com/v1/images/generations";
  Future<String> connectGPT({required String msg}) async {
    var urlApi = Uri.parse(url);
    try {
      var response = await http.post(urlApi,
          headers: {
            "Content-Type": "application/json",
            "Authorization": key,
          },
          body: json.encode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "system",
                "content":
                    // "You will be provided with a text prompt that describes the image the user want to generate, and your task is to use this prompt to generate an image that matches the description"
                    "You will be provided with a sentence in English , and your task is to translate it into french."
                //
              },
              {"role": "user", "content": msg},
            ],
            "temperature": 0,
            "max_tokens": 256,
            "top_p": 1,
            "frequency_penalty": 0,
            "presence_penalty": 0
          }));

      if (response.statusCode == 200) {
        final bodyGPT = json.decode(response.body);
        return bodyGPT["choices"][0]["message"]["content"];
      } else {
        return "No data ${response.body}";
      }
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

  // Future<String> getGPTImage({required String msg}) async {
  //   var urlApi = Uri.parse(imageUrl);
  //   try {
  //     var response = await http.post(urlApi,
  //         headers: {
  //           "Content-Type": "application/json",
  //           "Authorization": key,
  //         },
  //         body: json.encode({
  //           "model": "dall-e-3",
  //           "prompt": msg,
  //           "n": 1,
  //           "size": "1024x1024"
  //         }));

  //     if (response.statusCode == 200) {
  //       final bodyGPT = json.decode(response.body);
  //       final imageURL = bodyGPT["data"][0]['url'];

  //       return imageURL!;
  //     } else {
  //       return "No data ${response.body}";
  //     }
  //   } catch (e) {
  //     print("Error in getGPTImage: $e");
  //     throw FormatException(e.toString());
  //   }
  // }

  Future<String> getGPTImageToSave({required String msg}) async {
    var urlApi = Uri.parse(imageUrl);
    try {
      var response = await http.post(urlApi,
          headers: {
            "Content-Type": "application/json",
            "Authorization": key,
          },
          body: json.encode({
            "model": "dall-e-3",
            "prompt": msg,
            "n": 1,
            "size": "1024x1024"
          }));

      if (response.statusCode == 200) {
        final bodyGPT = json.decode(response.body);
        final imageURL = bodyGPT["data"][0]['url'];

        final pathImage = await saveImage(
            url: imageURL, imageName: DateTime.now().toString());

        await SupabaseFunc().uploudImage(pathImageLocal: pathImage);

        return pathImage;
      } else {
        return "No data ${response.body}";
      }
    } catch (e) {
      print("Error in getGPTImage: $e");
      throw FormatException(e.toString());
    }
  }
}
