// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';

class TexBox extends StatelessWidget {
  final String text;
  final String section;
  final Function()? onPresed;

  const TexBox({super.key, required this.text, required this.section, required this.onPresed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.grey),
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(section),
              IconButton(
                onPressed: onPresed, 
                icon: const Icon(Icons.settings))
            ],
          )
        ],
      ),
    );
  }
}
