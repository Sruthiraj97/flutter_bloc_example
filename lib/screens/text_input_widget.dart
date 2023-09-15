import 'package:flutter/material.dart';

class MyTextInputField extends StatelessWidget {
  final TextEditingController controller;

  const MyTextInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Enter a TODO',
      ),
    );
  }
}
