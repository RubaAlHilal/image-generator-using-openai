import 'package:flutter/material.dart';

class CardGPT extends StatelessWidget {
  CardGPT({super.key, required this.title, required this.isUser});
  final String title;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        constraints: const BoxConstraints(
            maxWidth: 400, maxHeight: 200, minHeight: 100, minWidth: 100),
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: isUser ? Colors.lightBlue.shade50 : Colors.grey.shade400,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
