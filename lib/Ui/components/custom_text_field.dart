import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.width, required this.controller, this.icon, this.hint});
  TextEditingController controller = TextEditingController();
  Widget? icon;
  String? hint;
  late double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.1),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        style: const TextStyle(
          fontSize: 14,
        ),
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
