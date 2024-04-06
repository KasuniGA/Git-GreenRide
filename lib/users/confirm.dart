// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RideConfirm extends StatefulWidget {
  const RideConfirm({super.key});

  @override
  State<RideConfirm> createState() => _RideConfirmState();
}

class _RideConfirmState extends State<RideConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SizedBox(
        height: Checkbox.width,
        child: Text("bla bla"),
      ),
    );
  }
}
