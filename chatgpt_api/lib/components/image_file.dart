import 'dart:io';

import 'package:flutter/material.dart';

class ImageCardGPTFile extends StatelessWidget {
  ImageCardGPTFile(
      {super.key,
      required this.title,
      required this.isUser,
      required this.GPTimage});
  final String title;
  final bool isUser;
  final String GPTimage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        constraints: const BoxConstraints(
            maxWidth: 400, maxHeight: 400, minHeight: 100, minWidth: 100),
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: isUser
                ? Colors.lightBlue.shade50
                : const Color.fromARGB(176, 189, 189, 189),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
             
                Image.network(
                  GPTimage,
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
