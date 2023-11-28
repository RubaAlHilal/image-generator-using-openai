import 'package:flutter/material.dart';

class TitleUser extends StatelessWidget {
  const TitleUser({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          maxWidth: 150, maxHeight: 75, minHeight: 60, minWidth: 100),
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
