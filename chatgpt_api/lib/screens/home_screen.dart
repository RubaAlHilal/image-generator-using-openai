import 'package:chatgpt_api_app/components/image_card.dart';
import 'package:chatgpt_api_app/networking/networking.dart';
import 'package:flutter/material.dart';

import '../components/card_g_p_t.dart';
import '../components/title_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String answer = '';

TextEditingController questionController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FocusScope.of(context).focusedChild;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(children: [
                    Text(
                      "Image Generator",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ]),
                  Flexible(
                    flex: 10,
                    child: SingleChildScrollView(
                        primary: true,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            CardGPT(
                              title: 'Username:\n${questionController.text}',
                              isUser: true,
                            ),
                            ImageCardGPT(
                                title: "ChatGPT",
                                isUser: false,
                                GPTimage: answer),
                          ],
                        )),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              flex: 4,
                              child: TextField(
                                controller: questionController,
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    label: Text("Ask Chatgpt"),
                                    border: OutlineInputBorder()),
                              ),
                            ),
                            Flexible(
                                flex: 1,
                                child: TextButton(
                                    onPressed: () async {
                                      final answerGPT = await ApiNetworking()
                                          .getGPTImage(
                                              msg: questionController.text);

                                      print(answerGPT);

                                      setState(() {
                                        answer = answerGPT;
                                      });
                                    
                                    },
                                    child: const Text("Ask"))),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
